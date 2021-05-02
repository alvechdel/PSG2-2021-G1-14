package org.springframework.samples.petclinic.web;

import java.time.LocalDate;
import java.util.Collection;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Owner;
import org.springframework.samples.petclinic.model.Pet;
import org.springframework.samples.petclinic.model.Request;
import org.springframework.samples.petclinic.model.User;
import org.springframework.samples.petclinic.service.OwnerService;
import org.springframework.samples.petclinic.service.PetService;
import org.springframework.samples.petclinic.service.UserService;
import org.springframework.samples.petclinic.service.exceptions.DuplicatedRequestException;
import org.springframework.samples.petclinic.service.exceptions.SameOwnerException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RequestController {
    
    private final PetService petService;
    private final UserService userService;
    private final OwnerService ownerService;

    @Autowired
    public RequestController(PetService petService,OwnerService ownerService,  UserService userService){
        this.petService=petService;
        this.userService=userService;
        this.ownerService=ownerService;
    }

    @GetMapping(value="/adoptions")
	public String showAvailableAdoptionPets(Map<String, Object> model) {
		Collection<Pet> pets=petService.findAvalaibleAdoption();
		model.put("pets", pets);
        model.put("user", userService.getLoggedUser());
		return "adoptions/adoptionsList";
	}

    @GetMapping(value="/owners/{ownerId}/requests")
    public String showRequestByOwner(@PathVariable("ownerId") int ownerId, Map<String, Object> model) {
        Collection<Request> requests=petService.findRequestByOwnerOfPet( ownerService.findOwnerById(ownerId));
        model.put("requests", requests);
        return "adoptions/requestList";
    }
    
    @PostMapping(value="/request/accept")
    public String acceptRequest(Integer requestId){
        petService.acceptRequest(requestId);
        return "redirect:/adoptions";
    }

    @InitBinder
    public void setAllowedFields(WebDataBinder dataBinder) {
        dataBinder.setDisallowedFields("id");
    }

    @GetMapping(value="adoptions/{petId}/new")
    public String initNewRequestForm(@PathVariable("petId") int petId, Map<String, Object> model){
        User user=userService.getLoggedUser();
        Owner owner=ownerService.findOwnerByUsername(user.getUsername());
        Pet pet=this.petService.findPetById(petId);
        Request request=new Request();
        owner.addRequest(request);
        pet.addRequest(request);
        model.put("request", request);
        return "adoptions/createOrUpdateRequestForm";
    }

    @PostMapping(value="/adoptions/{petId}/new")
    public String processNewRequestForm(@Valid Request request, BindingResult result){
        if(result.hasErrors()) {
            return "adoptions/createOrUpdateRequestForm";
        }else {
            try{
                request.setDate(LocalDate.now());
                petService.saveRequest(request);
            }catch (DuplicatedRequestException ex){
                result.rejectValue("comment","Duplicated", "No puedes realizar dos solicitudes de adopcion de una misma mascota");
                return "adoptions/createOrUpdateRequestForm";
            }catch (SameOwnerException ex1) {
                result.rejectValue("comment", "SameOwner", "No puedes realizar una solicitud de adopcion a tu propia mascota");
                return "adoptions/createOrUpdateRequestForm";
            }
            
            return "redirect:/adoptions";
        }
    }

}
