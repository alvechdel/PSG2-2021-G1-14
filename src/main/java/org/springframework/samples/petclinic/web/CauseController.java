package org.springframework.samples.petclinic.web;


import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Cause;
import org.springframework.samples.petclinic.model.Donation;
import org.springframework.samples.petclinic.model.Owner;
import org.springframework.samples.petclinic.model.User;
import org.springframework.samples.petclinic.service.CauseService;
import org.springframework.samples.petclinic.service.DonationService;
import org.springframework.samples.petclinic.service.OwnerService;
import org.springframework.samples.petclinic.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/causes")
public class CauseController {

	private static final String VIEW_CREATE_CAUSE="causes/createCause";

	private static final String VIEW_LIST_CAUSE="causes/causeList";

	private static final String VIEW_CREATE_DONATION = "donations/createDonation";	

	private final CauseService causeService;

	private final DonationService donationService;

	private final UserService userService;

	private final OwnerService ownerService;

	@Autowired
	public CauseController(CauseService causeService, DonationService donationService, UserService userService, OwnerService ownerService){
		this.causeService=causeService;
		this.donationService=donationService;
		this.userService=userService;
		this.ownerService=ownerService;
	}
	
	@GetMapping()
	public String causeActiveList(ModelMap modelMap) {
		List<Cause> causes = causeService.findCauseByActiveStatus(true);
		modelMap.addAttribute("causes",causes);
		return VIEW_LIST_CAUSE;
	}

	@GetMapping(path="/inactive")
	public String causeInactiveList(ModelMap modelMap) {
		List<Cause> causes = causeService.findCauseByActiveStatus(false);
		modelMap.addAttribute("causes",causes);
		return VIEW_LIST_CAUSE;
	}

	
	@GetMapping(path="/{causeId}")
	public String causeDetails(@PathVariable("causeId") final int causeId, ModelMap modelMap) {
		Cause cause = causeService.findCauseById(causeId);
		modelMap.addAttribute("cause",cause);
		return "causes/detailsCause";
	}
	
	
	@GetMapping(path="/new")
	public String newCause(ModelMap modelMap) {
		modelMap.addAttribute("cause", new Cause());
		return VIEW_CREATE_CAUSE;
	}
	
	@PostMapping(path="/save")
	public String saveCause(@Valid Cause cause, BindingResult result, ModelMap modelMap) {
		
		if(result.hasErrors()) {
			modelMap.addAttribute("cause",cause);
			return VIEW_CREATE_CAUSE;
		}else {
			causeService.save(cause);
			return "redirect:/causes";
		}
		
	}
	
	@GetMapping(value = "{causeId}/donation/{donationId}")
	public String listDetailsDonations(@PathVariable("causeId") final int causeId, @PathVariable("donationId") final int donationId,  ModelMap model) {
		Donation donation = this.donationService.findDonationById(donationId);
		model.put("donation", donation);
		return "donations/donationDetails";
	}
	
	@GetMapping(path="{causeId}/newDonation")
	public String newDonation(@PathVariable("causeId") int causeId, ModelMap modelMap) {
		modelMap.addAttribute("donation", new Donation());
		Cause cause = this.causeService.findCauseById(causeId);
		modelMap.addAttribute("cause", cause);
		return VIEW_CREATE_DONATION;
	}

	@PostMapping(path="{causeId}/saveDonation")
	public String saveDonation(@PathVariable("causeId") final int causeId, @Valid Donation donation, BindingResult result, ModelMap modelMap) {
		
		if(result.hasErrors()) {
			modelMap.addAttribute("donation", donation);
			return VIEW_CREATE_DONATION;
		}else {
			Cause cause = this.causeService.findCauseById(causeId);
			donation.setCause(cause);
			User user=userService.getLoggedUser();
			Owner owner=ownerService.findOwnerByUsername(user.getUsername());
			donation.setAuthor(owner.getFirstName() + " " + owner.getLastName());
			donationService.save(donation);
			causeService.save(cause);
			return "redirect:/causes";
		}
		
	}
}
