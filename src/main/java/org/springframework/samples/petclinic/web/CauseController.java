package org.springframework.samples.petclinic.web;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Cause;
import org.springframework.samples.petclinic.service.CauseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/causes")
public class CauseController {

	@Autowired
	private CauseService causeService;
	
	@GetMapping()
	public String causeList(ModelMap modelMap) {
		String view = "causes/causeList";
		Iterable<Cause> causes = causeService.findAll();
		modelMap.addAttribute("causes",causes);
		return view;
	}
	
	@GetMapping(path="/new")
	public String newCause(ModelMap modelMap) {
		String view="causes/createCause";
		modelMap.addAttribute("cause", new Cause());
		return view;
	}
	
	@PostMapping(path="/save")
	public String saveCause(@Valid Cause cause, BindingResult result, ModelMap modelMap) {
		
		if(result.hasErrors()) {
			modelMap.addAttribute("cause",cause);
			return "causes/createCause";
		}else {
			causeService.save(cause);
			return "redirect:/causes";
		}
		
	}
}
