package org.springframework.samples.petclinic.web;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Cause;
import org.springframework.samples.petclinic.model.Donation;
import org.springframework.samples.petclinic.service.CauseService;
import org.springframework.samples.petclinic.service.DonationService;
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

	private static final String VIEW_CREATE_DONATION = "causes/createDonation";

	private CauseService causeService;

	private DonationService donationService;

	@Autowired
	public CauseController(CauseService causeService, DonationService donationService){
		this.causeService=causeService;
		this.donationService=donationService;

	}
	
	@GetMapping()
	public String causeList(ModelMap modelMap) {
		Iterable<Cause> causes = causeService.findAll();
		modelMap.addAttribute("causes",causes);
		return "causes/causeList";
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

	@GetMapping(path="{causeId}/newDonation")
	public String newDonation(@PathVariable("causeId") int causeId, ModelMap modelMap) {
		modelMap.addAttribute("donation", new Donation());
		return VIEW_CREATE_DONATION;
	}

	@PostMapping(path="{causeId}/saveDonation")
	public String saveDonation(@Valid Donation donation, BindingResult result, ModelMap modelMap) {
		
		if(result.hasErrors()) {
			modelMap.addAttribute("donation", donation);
			return VIEW_CREATE_DONATION;
		}else {
			donationService.save(donation);
			return "redirect:/causes";
		}
		
	}
}
