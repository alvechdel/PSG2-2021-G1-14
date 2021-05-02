/*
 * Copyright 2002-2013 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.springframework.samples.petclinic.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.petclinic.model.Book;
import org.springframework.samples.petclinic.model.Owner;
import org.springframework.samples.petclinic.model.Pet;
import org.springframework.samples.petclinic.model.PetType;
import org.springframework.samples.petclinic.model.Request;
import org.springframework.samples.petclinic.model.Visit;
import org.springframework.samples.petclinic.repository.BookRepository;
import org.springframework.samples.petclinic.repository.PetRepository;
import org.springframework.samples.petclinic.repository.RequestRepository;
import org.springframework.samples.petclinic.repository.VisitRepository;
import org.springframework.samples.petclinic.service.exceptions.DuplicatedPetNameException;
import org.springframework.samples.petclinic.service.exceptions.DuplicatedRequestException;
import org.springframework.samples.petclinic.service.exceptions.OverlappingBooksException;
import org.springframework.samples.petclinic.service.exceptions.OverlappingDatesException;
import org.springframework.samples.petclinic.service.exceptions.SameOwnerException;
import org.springframework.samples.petclinic.util.BookValidator;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

/**
 * Mostly used as a facade for all Petclinic controllers Also a placeholder
 * for @Transactional and @Cacheable annotations
 *
 * @author Michael Isvy
 */
@Service
public class PetService {

	private PetRepository petRepository;
	
	private VisitRepository visitRepository;

	private BookRepository bookRepository;

	private RequestRepository requestRepository;
	

	@Autowired
	public PetService(PetRepository petRepository,
			VisitRepository visitRepository,
			BookRepository bookRepository,
			RequestRepository requestRepository) {
		this.petRepository = petRepository;
		this.visitRepository = visitRepository;
		this.bookRepository=bookRepository;
		this.requestRepository=requestRepository;
	}

	@Transactional(readOnly = true)
	public Collection<PetType> findPetTypes() throws DataAccessException {
		return petRepository.findPetTypes();
	}
	
	@Transactional
	public void saveVisit(Visit visit) throws DataAccessException {
		visitRepository.save(visit);
	}

	@Transactional(readOnly = true)
	public Collection<Book> findBookingsByPet(Pet pet) throws DataAccessException {
		return bookRepository.findByPet(pet);
	}

	@Transactional(rollbackFor = OverlappingBooksException.class, readOnly = true)	
	public void saveBook(Book book) throws DataAccessException, OverlappingDatesException, OverlappingBooksException {
		this.OverlappingDates(book);
		Collection<Book> bookings= this.findBookingsByPet(book.getPet());
		BookValidator.bookIsOccupied(book, bookings);
		bookRepository.save(book);
	}

	@Transactional(rollbackFor = DuplicatedRequestException.class)
	public void saveRequest(Request request) throws DuplicatedRequestException,SameOwnerException  {
		this.sameOwner(request);
		if(requestRepository.validateDuplicateRequest(request.getPet(), request.getOwner())!=0) throw new DuplicatedRequestException();
		else requestRepository.save(request);
	}

	@Transactional(rollbackFor = SameOwnerException.class)
	public void sameOwner(Request request) throws SameOwnerException{
		if(request.getOwner().equals(request.getPet().getOwner())) throw new SameOwnerException();
	}



	@Transactional(rollbackFor = OverlappingDatesException.class, readOnly = true)
	public void OverlappingDates(Book book) throws OverlappingDatesException{
		if(book.getEndDate().isBefore(book.getStartDate())) {
			throw new OverlappingDatesException();
		}
	}

	@Transactional(readOnly = true)
	public Pet findPetById(int id) throws DataAccessException {
		return petRepository.findById(id);
	}

	@Transactional(rollbackFor = DuplicatedPetNameException.class)
	public void savePet(Pet pet) throws DataAccessException, DuplicatedPetNameException {
			Pet otherPet=pet.getOwner().getPetwithIdDifferent(pet.getName(), pet.getId());
            if (StringUtils.hasLength(pet.getName()) &&  (otherPet!= null && !otherPet.getId().equals(pet.getId()))) {            	
            	throw new DuplicatedPetNameException();
            }else
                petRepository.save(pet);                
	}

	@Transactional
	public Visit findVisitById(int visitId){
		return visitRepository.findById(visitId);
	}

	@Transactional
	public Collection<Visit> findVisitsByPetId(int petId) {
		return visitRepository.findByPetId(petId);
	}

	@Transactional
	public void deletePet(Pet pet) throws DataAccessException {
		petRepository.delete(pet);
	}

	@Transactional
	public void putUpForAdoption(Pet pet) {
		pet.setAdoption(true);
		petRepository.save(pet);
	}
	
	@Transactional
	public void deleteVisit(Visit visit) throws DataAccessException {
		visitRepository.delete(visit);
	}	
	@Transactional(readOnly = true)
	public Collection<Pet> findAvalaibleAdoption(){
		return petRepository.findAvailableAdoption();
	}

	@Transactional(readOnly=true)
	public Collection<Request> findRequestByOwnerOfPet(Owner owner){
		return requestRepository.findByOwnerOfPet(owner);
	}

	@Transactional
    public void acceptRequest(Integer requestId) {
		Request r=requestRepository.findById(requestId);
		r.setAccepted(true);
		Pet p =r.getPet();
		p.setOwner(r.getOwner());
		p.setAdoption(false);
		requestRepository.deleteRequestsByPet(p);
		petRepository.save(p);
		requestRepository.save(r);
    }

	public void putDownForAdoption(Pet pet) {
		pet.setAdoption(false);
		petRepository.save(pet);
	}

}
