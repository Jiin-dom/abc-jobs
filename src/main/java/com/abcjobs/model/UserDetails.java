package com.abcjobs.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user_profile")
public class UserDetails {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_profile")
	private Long userDetailsId;
	
	@Column(name = "id_user")
	private String userId;
	
	@OneToOne(optional=false)
	@JoinColumn(name = "id_user", referencedColumnName = "id_user", insertable=false, updatable=false)
	private Users user;
	

	@Column(name = "first_name")
	private String firstName;
	
	@Column(name = "last_name")
	private String lastName;
	
	@Column(name = "headline")
	private String headline;
	
	@Column(name = "about")
	private String about;
	
	@Column(name = "company")
	private String company;
	
	@Column(name = "city")
	private String city;
	
	@Column(name="country")
	private String country;
	
	@Column(name="phone")
	private String phone;
	
	
	public UserDetails() {}

	public UserDetails(Long userDetailsId, String userId, Users user, String city, String firstName, String lastName,
			String headline, String about, String company, String country, String phone) {
		this.userDetailsId = userDetailsId;
		this.userId = userId;
		this.user = user;
		this.city = city;
		this.firstName = firstName;
		this.lastName = lastName;
		this.headline = headline;
		this.about = about;
		this.company = company;
		this.country = country;
		this.phone = phone;
	}

	public Long getUserDetailsId() {
		return userDetailsId;
	}

	public void setUserDetailsId(Long userDetailsId) {
		this.userDetailsId = userDetailsId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}


	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getHeadline() {
		return headline;
	}

	public void setHeadline(String headline) {
		this.headline = headline;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}


