package com.abcjobs.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abcjobs.model.Experiences;
import com.abcjobs.model.UserDetails;
import com.abcjobs.repository.UserDetailsRepository;

@Service
@Transactional
public class UserDetailsService {
	@Autowired
	UserDetailsRepository repo;
	
	public UserDetails register(UserDetails userDetails) {
		return repo.save(userDetails);
	}
	
	public String getDetailsById(String userId) {
		return repo.getDetailsById(userId);
	}
	
	public UserDetails updateProfile(Long userDetailsId, UserDetails ud) {
		UserDetails userDetails = repo.findById(userDetailsId).get();
		
		// update
		userDetails.setFirstName(ud.getFirstName());
		userDetails.setLastName(ud.getLastName());
		userDetails.setHeadline(ud.getHeadline());
		userDetails.setAbout(ud.getAbout());
		userDetails.setPhone(ud.getPhone());
		userDetails.setCompany(ud.getCompany());
		userDetails.setCity(ud.getCity());
		userDetails.setCountry(ud.getCountry());
		
		// save
 		return repo.save(userDetails);
	}
	
	public UserDetails updateAbout(Long userDetailsId, UserDetails ud) {
		UserDetails userDetails = repo.findById(userDetailsId).get();
		
		userDetails.setAbout(ud.getAbout());
		
		return repo.save(userDetails);
	}
//	
//	public Experiences updateExperience(Long userDetailsId, Experiences ud) {
//		UserDetails expDetails = repo.findById(userDetailsId).get();
//		
////		expDetails.setUserDetailsId(udID);
//		expDetails.setCompany(ud.getCompany());
//		expDetails.setPosition(ud.getPosition());
//		expDetails.setStartDate(ud.getStartDate());
//		expDetails.setEndDate(ud.getEndDate());
//		
//		return repo.save(userDetails);
//	}
//	
//	
//	public UserDetails updateEducation(Long userDetailsId, UserDetails ud) {
//		UserDetails userDetails = repo.findById(userDetailsId).get();
//		
//		userDetails.setAbout(ud.getAbout());
//		
//		return repo.save(userDetails);
//	}
	
	
	public List<UserDetails> searchByKey(String key) {
		return repo.searchByKey(key);
	}
	
	public List<UserDetails> getAllUserDetails() {
		return repo.findAll();
	}
	
	public UserDetails getDetailsById(Long id) {
		return repo.findById(id).get();
	}

}
