package org.springframework.samples.petclinic.model;


import java.math.BigDecimal;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="donations")
public class Donation extends BaseEntity {
	
	private String author;
	
    @NotBlank(message = "El mensaje no puede estar en blanco")
	private String message;
	
    @NotNull(message="Debe introducir una cantidad de dinero")
    @DecimalMin(value = "1.00", message = "La donación mínima es 1 &euro;")
	@Digits(integer=6, fraction=2,message="Dos decimales como máximo")
	private BigDecimal amount;
	
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm")
	private LocalDateTime donationDate=LocalDateTime.now().withNano(0);
    
    
    @ManyToOne
    @JoinColumn(name="cause_id")
    private Cause cause;

    public String getAuthor() {
    	return author;
    }
    
    public void setAuthor(String author) {
    	this.author = author;
    }
    
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public BigDecimal getAmount(){
        return amount;
    }

    public void setAmount(BigDecimal amount){
        this.amount=amount;
    }

    public LocalDateTime getDonationDate() {
        return donationDate;
    }
    
    public Cause getCause(){
        return cause;
    }

    public void setCause(Cause cause){
        this.cause=cause;
    }
  

}