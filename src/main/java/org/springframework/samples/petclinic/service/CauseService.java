package org.springframework.samples.petclinic.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Cause;
import org.springframework.samples.petclinic.repository.CauseRepository;
import org.springframework.stereotype.Service;

@Service
public class CauseService {
	
	@Autowired
	private CauseRepository causeRepo;
	
	@Transactional
	public Iterable<Cause> findAll() {
		return causeRepo.findAll();
	}
	
	@Transactional
	public void save(Cause cause) {
		causeRepo.save(cause);
	}
	
}
