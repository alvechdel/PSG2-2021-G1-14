package org.springframework.samples.petclinic.repository;

import org.springframework.dao.DataAccessException;
import org.springframework.data.repository.Repository;
import org.springframework.samples.petclinic.model.Request;

public interface RequestRepository  extends Repository<Request, Integer>{
    
    void save(Request request) throws DataAccessException;
}
