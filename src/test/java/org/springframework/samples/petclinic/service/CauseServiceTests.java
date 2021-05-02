package org.springframework.samples.petclinic.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.Test;
import org.junit.jupiter.api.BeforeEach;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.samples.petclinic.model.Cause;
import org.springframework.samples.petclinic.model.Donation;
import org.springframework.samples.petclinic.repository.CauseRepository;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest
@RunWith(SpringRunner.class)
public class CauseServiceTests {

    @Autowired
	protected CauseService causeService;
    
    @MockBean
    protected CauseRepository causeRepository;

    private Donation donation;
    private Set<Donation> donations=new HashSet<>();
    private Cause cause;

     @BeforeEach
	 public void setUp() {
          causeService=new CauseService(causeRepository);

         cause=new Cause();
         cause.setId(1);
         cause.setDescription("Prueba de descripción");
         cause.setBudget(15300.5);
         cause.setActiveStatus(true);
         cause.setName("Educación infantil");
         cause.setOrganization("UNICEF");

         donation=new Donation();
         donation.setId(1);
         donation.setAmount(new BigDecimal("54.30"));
         donation.setAuthor("Antonio");
         donation.setMessage("donación de prueba");
         donation.setCause(cause);

         donations.add(donation);
         cause.setDonations(donations);


     }


    @Test
    public void testFindAll() throws Exception{
    	List<Cause> causas = new ArrayList<Cause>();
    	causas.add(cause);
    	Iterable<Cause> causasit = causas; 
        when(causeRepository.findAll()).thenReturn(causasit);
        causeService.findAll();
        verify(causeRepository).findAll();
        assertEquals(causasit, causeService.findAll());
    }

     @Test
     public void testFindCauseById() throws Exception{
        
         when(causeRepository.findById(anyInt())).thenReturn(cause);

         causeService.findCauseById(anyInt());

         verify(causeRepository).findById(anyInt());
         assertEquals(cause, causeService.findCauseById(anyInt()));

     }
    
}