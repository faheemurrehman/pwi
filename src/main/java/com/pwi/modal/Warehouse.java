package com.pwi.modal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Warehouses")
public class Warehouse {
	
	@Id
    @Column(name = "ID")
    @GeneratedValue
	private Integer id;
	
	@Column(name = "Name")
	private String name;
	
	@Column(name = "Desc")
	private String desctiption;
	
	@ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST,CascadeType.MERGE })
	@JoinColumn(name = "CompanyLocation_ID", insertable = true, updatable = true, nullable = false)
	private CompanyLocation location;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesctiption() {
		return desctiption;
	}

	public void setDesctiption(String desctiption) {
		this.desctiption = desctiption;
	}

	public CompanyLocation getLocation() {
		return location;
	}

	public void setLocation(CompanyLocation location) {
		this.location = location;
	}
	
	

}
