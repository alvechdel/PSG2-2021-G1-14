package org.springframework.samples.petclinic.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;


@Entity
@Table(name="causes")
public class Cause extends NamedEntity{
	
	@NotNull
	@NotBlank
	private String description;
	
	@Min(value=1,message="La cantidad objetivo mínima debe de ser 1")
	@NotNull
	private Double budget;
	
	@NotNull
	@NotBlank
	private String organization;
	
	@NotNull
	private Boolean activeStatus;

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
	
	public Cause() {
		super();
		this.activeStatus = true;
	}


	
}
