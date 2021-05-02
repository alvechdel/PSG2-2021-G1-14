package org.springframework.samples.petclinic.service;

import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.petclinic.model.Cause;
import org.springframework.samples.petclinic.repository.CauseRepository;
import org.springframework.stereotype.Service;
@Service
public class CauseService {
	
	private CauseRepository causeRepo;

	@Autowired
	public 	CauseService(CauseRepository causeRepository){
		this.causeRepo=causeRepository;
	}
	
	@Transactional
	public Iterable<Cause> findAll() {
		return causeRepo.findAll();
	}

	@Transactional(readOnly = true)
	public List<Cause> findCauseByActiveStatus(Boolean status) throws DataAccessException {
		return causeRepo.findByActiveStatus(status);
	}

	@Transactional(readOnly = true)
	public Cause findCauseById(int id) throws DataAccessException {
		return causeRepo.findById(id);
	}
	
	@Transactional
	public void save(Cause cause) {
		Integer res = cause.getTotalAmount().compareTo(BigDecimal.valueOf(cause.getBudget()));
		if(res >= 0){
			cause.setActiveStatus(false);
		}
		causeRepo.save(cause);
	}
	@Transactional
	public void delete(Cause cause) {
		 causeRepo.delete(cause);
	}
	
}
