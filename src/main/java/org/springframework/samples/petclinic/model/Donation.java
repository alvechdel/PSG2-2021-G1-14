package org.springframework.samples.petclinic.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="donations")
public class Donation extends BaseEntity {

	private String message;
	
	@Digits(integer=6, fraction=2,message="Dos decimales como máximo")
    @Min(value=1, message="La donación mínima ha de ser 1 €")
	@NotNull
	private BigDecimal amount;
	
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm")
	private LocalDateTime donationDate=LocalDateTime.now();
    
	@NotNull
	private Boolean isAnonymous;

    @ManyToOne
    @JoinColumn(name="cause_id")
    private Cause cause;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public BigDecimal getAmount(){
        return amount.setScale(2);
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
    
	public Boolean getIsAnonymous() {
		return isAnonymous;
	}

	public void setIsAnonymous(Boolean isAnonymous) {
		this.isAnonymous = isAnonymous;
	}


}