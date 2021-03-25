package org.springframework.samples.petclinic.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.data.repository.Repository;
import org.springframework.samples.petclinic.model.Book;

public interface BookRepository extends Repository<Book, Integer> {
    void save(Book book) throws DataAccessException;

    List<Book> findByPetId(Integer petId);
}
