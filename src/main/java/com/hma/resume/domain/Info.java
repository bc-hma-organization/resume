package com.hma.resume.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "info")
public class Info {

	/**
	 * 信息id
	 */
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	/**
	 * 外键，用户ID
	 */
	@Column(name = "userID")
	private Integer userId;
	
	/**
	 * 开始时间
	 */
	@Column(name = "startTime")
	private Date startTime;
	
	/**
	 * 结束时间
	 */
	@Column(name = "endTime")
	private Date endTime;
	
	/**
	 * 单位/学校
	 */
	@Column(name = "company")
	private String company;
	
	/**
	 * 职位/学历
	 */
	@Column(name = "position")
	private String position;
	
	/**
	 * 简单描述
	 */
	@Column(name = "description")
	private String description;
	
	/**
	 * 状态0/1(未启用)
	 */
	@Column(name = "status")
	private Integer status;
	
	/**
	 * 学位
	 */
	@Column(name = "education")
	private String education;

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}
	
}
