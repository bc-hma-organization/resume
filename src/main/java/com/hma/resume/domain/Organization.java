package com.hma.resume.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "organization")
public class Organization {
	
	/**
	 * 角色id
	 */
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	/**
	 * 机构名
	 */
	@Column(name = "organizaName")
	private String organizaName;
	
	/**
	 * 机构地址
	 */
	@Column(name = "organizaAddress")
	private String organizaAddress;
	
	/**
	 * 机构电话
	 */
	@Column(name = "organizaPhone")
	private String organizaPhone;
	
	/**
	 * 机构logo
	 */
	@Column(name = "logo")
	private String logo;
	
	/**
	 * 法人
	 */
	@Column(name = "legalPerson")
	private String legalPerson;
	
	/**
	 * 联系人
	 */
	@Column(name = "contact")
	private String contact;
	
	/**
	 * 联系人电话
	 */
	@Column(name = "contactPhone")
	private String contactPhone;
	
	/**
	 * 简介
	 */
	@Column(name = "description")
	private String description;
	
	/**
	 * 状态0/1(未启用)
	 */
	@Column(name = "status")
	private String status;
	
	/**
	 * 机构key
	 */
	@Column(name = "organizaKey")
	private String organizaKey;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrganizaName() {
		return organizaName;
	}

	public void setOrganizaName(String organizaName) {
		this.organizaName = organizaName;
	}

	public String getOrganizaAddress() {
		return organizaAddress;
	}

	public void setOrganizaAddress(String organizaAddress) {
		this.organizaAddress = organizaAddress;
	}

	public String getOrganizaPhone() {
		return organizaPhone;
	}

	public void setOrganizaPhone(String organizaPhone) {
		this.organizaPhone = organizaPhone;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getLegalPerson() {
		return legalPerson;
	}

	public void setLegalPerson(String legalPerson) {
		this.legalPerson = legalPerson;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getContactPhone() {
		return contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOrganizaKey() {
		return organizaKey;
	}

	public void setOrganizaKey(String organizaKey) {
		this.organizaKey = organizaKey;
	}
	
	
}
