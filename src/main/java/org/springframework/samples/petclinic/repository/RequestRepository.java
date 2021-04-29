package org.springframework.samples.petclinic.repository;

import java.util.Collection;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;
import org.springframework.samples.petclinic.model.Owner;
import org.springframework.samples.petclinic.model.Pet;
import org.springframework.samples.petclinic.model.Request;

public interface RequestRepository  extends Repository<Request, Integer>{
    
    void save(Request request) throws DataAccessException;

    @Query("SELECT count(*) FROM Request r WHERE r.owner=:owner AND  r.pet=:pet")
    Integer validateDuplicateRequest(@Param("pet") Pet pet, @Param("owner") Owner owner);
    
    @Query("SELECT r FROM Request r WHERE r.pet.owner=:owner ")
    List<Request> findByOwnerOfPet(@Param("owner") Owner owner);

    Request findById(Integer id);

    @Modifying
    @Query("DELETE FROM Request r WHERE r.pet=:pet")
    void deleteRequestsByPet(@Param("pet") Pet pet);
}
