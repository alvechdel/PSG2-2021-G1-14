package org.springframework.samples.petclinic.service;

import org.springframework.transaction.annotation.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
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

	@Transactional(readOnly = true)
	public Cause findCauseById(int id) throws DataAccessException {
		return causeRepo.findById(id);
	}
	
	@Transactional
	public void save(Cause cause) {
		causeRepo.save(cause);
	}
	
}
