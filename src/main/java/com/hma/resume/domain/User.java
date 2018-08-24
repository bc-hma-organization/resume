package com.hma.resume.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User {

	/**
	 * 角色id
	 */
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	/**
	 * 用户名
	 */
	@Column(name = "username")
	private String userName;
	
	/**
	 * 性别
	 */
	@Column(name = "sex")
	private Boolean sex;
	
	/**
	 * 年龄
	 */
	@Column(name = "age")
	private Integer age;
	
	/**
	 * 地址
	 */
	@Column(name = "address")
	private String address;
	
	/**
	 * 电话
	 */
	@Column(name = "phone")
	private String phone;
	
	/**
	 * email邮箱
	 */
	@Column(name = "email")
	private String email;
	
	/**
	 * 密码
	 */
	@Column(name = "password")
	private String password;
	
	/**
	 * 真实姓名
	 */
	@Column(name = "turename")
	private String turename;
	
	/**
	 * 状态 0/1
	 */
	@Column(name = "status")
	private Integer status;
	
	/**
	 * 相片
	 */
	@Column(name = "picture")
	private String picture;
	
	/**
	 * 机构id
	 */
	@Column(name = "organizationID")
	private Integer organizationID;
	
	/**
	 * 身份证号码
	 */
	@Column(name = "identityCard")
	private String identityCard;
}
