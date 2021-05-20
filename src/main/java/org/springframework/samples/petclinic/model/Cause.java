package org.springframework.samples.petclinic.model;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.beans.support.MutableSortDefinition;
import org.springframework.beans.support.PropertyComparator;


@Entity
@Table(name="causes")
public class Cause extends NamedEntity{
	
	@NotBlank
	private String description;

	@NotNull(message="La cantidad debe ser al menos 1 &euro;")
	@Min(value=1,message="La cantidad objetivo mínima debe de ser 1 &euro;")
	private Double budget;
	
	@NotBlank
	private String organization;
	
	@NotNull
	private Boolean activeStatus;

	@OneToMany(cascade = CascadeType.ALL, mappedBy="cause")
	private Set<Donation> donations;

	public BigDecimal getTotalAmount(){
        BigDecimal res=BigDecimal.ZERO;
        if(donations!= null && !donations.isEmpty()){
            res=donations.stream().map(x->x.getAmount().setScale(2, RoundingMode.HALF_DOWN)).reduce(BigDecimal.ZERO, BigDecimal::add);
        }
        return res;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getBudget() {
		return budget;
	}

	public void setBudget(Double budget) {
		this.budget = budget;
	}

	public String getOrganization() {
		return organization;
	}

	public void setOrganization(String organization) {
		this.organization = organization;
	}

	public Boolean getActiveStatus() {
		return activeStatus;
	}

	public void setActiveStatus(Boolean activeStatus) {
		this.activeStatus = activeStatus;
	}

	protected Set<Donation> getDonationsInternal() {
		if (this.donations == null) {
			this.donations = new HashSet<>();
		}
		return this.donations;
	}
	
	public List<Donation> getDonations() {
		List<Donation> sortedDonation = new ArrayList<>(getDonationsInternal());
		PropertyComparator.sort(sortedDonation, new MutableSortDefinition("id", true, true));
		return sortedDonation;
	}

	public void setDonations(Set<Donation> donations){
		this.donations=donations;

	}

	protected void setDonationsInternal(Set<Donation> donations) {
		this.donations=donations;
	}

	public void addDonation(Donation donation) {
		getDonationsInternal().add(donation);
	}
	
	public Cause() {
		super();
		this.activeStatus = true;
	}


	
}
