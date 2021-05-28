package org.springframework.samples.petclinic.web;

import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Book;
import org.springframework.samples.petclinic.model.Pet;
import org.springframework.samples.petclinic.service.PetService;
import org.springframework.samples.petclinic.service.exceptions.OverlappingBooksException;
import org.springframework.samples.petclinic.service.exceptions.OverlappingDatesException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BookController {
    
    private final PetService petService;
  
    private final static String CREATE_UPDATE_BOOK = "pets/createOrUpdateBookForm";
    
    @Autowired
    public BookController(PetService petService){
        this.petService=petService;
    }

    @InitBinder
    public void setAllowedFields(WebDataBinder dataBinder) {
        dataBinder.setDisallowedFields("id");
    }

    @ModelAttribute("book")
    public Book loadPetWithBook(@PathVariable("petId") int petId) {
        Pet pet=this.petService.findPetById(petId);
        Book book = new Book();
        pet.addBook(book);
        return book;
    }

    @GetMapping(value="/owners/*/pets/{petId}/books/new")
    public String initNewBookForm(@PathVariable("petId") int petId, Map<String, Object> model) {
        return CREATE_UPDATE_BOOK;
    }

    @PostMapping(value="/owners/{ownerId}/pets/{petId}/books/new")
    public String processNewVisitForm(@Valid Book book, BindingResult result) {
        if(result.hasErrors()) {
            return CREATE_UPDATE_BOOK;
        }else {
            try{
                petService.saveBook(book);
            }catch(OverlappingDatesException ex ){
                result.rejectValue("endDate","overlap", "Es anterior a la fecha de inicio");
                return CREATE_UPDATE_BOOK;
            }catch(OverlappingBooksException ex1){
                result.rejectValue("startDate","overlap", "Esta mascota ya tiene una reserva para estas fechas");
                return CREATE_UPDATE_BOOK;
            }

            
            return "redirect:/owners/{ownerId}";
        }
    }
}
