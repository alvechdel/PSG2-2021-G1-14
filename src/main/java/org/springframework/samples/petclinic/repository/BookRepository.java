package org.springframework.samples.petclinic.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;
import org.springframework.samples.petclinic.model.Book;
import org.springframework.samples.petclinic.model.Pet;

public interface BookRepository extends Repository<Book, Integer> {
    
    void save(Book book) throws DataAccessException;

    List<Book> findByPetId(Integer petId);

    @Query("SELECT count(*) FROM Book k WHERE k.pet.id=:petId AND k.startDate < :end AND k.endDate > :start")
    Integer findOverlappingBooks(@Param("petId") Integer petId, @Param("start") LocalDate start,  @Param("end") LocalDate end);

    List<Book> findByPet(Pet pet);
}
