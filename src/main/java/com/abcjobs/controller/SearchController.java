package com.abcjobs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abcjobs.model.UserDetails;
import com.abcjobs.service.EducationsService;
import com.abcjobs.service.ExperiencesService;
import com.abcjobs.service.UserDetailsService;

@Controller
public class SearchController {

	@Autowired
	UserDetailsService ud;
	
	@Autowired
	EducationsService eds;
	
	@Autowired
	ExperiencesService exs;
	
	@RequestMapping(value="/search")
	public ModelAndView search(HttpServletRequest req, Model model) throws Exception {
		String q = req.getParameter("q");
		
		
		if(q != null && !q.equals("")) {
			q = q.split(" ")[0];
			List<UserDetails> selectedUser = ud.searchByKey(q);
			model.addAttribute("selected", selectedUser);
			
			if(selectedUser.size() == 0) {
				model.addAttribute("notFound", true);
			}
		}
		
		
		
		return new ModelAndView("search/search");  
	}
	
	@RequestMapping(value="/result", method = RequestMethod.POST) // view someone profile
	public ModelAndView searchProfile(@RequestParam("uId") String uId, Model model, HttpSession session) throws Exception {
		this.setModel(model, session, uId);
		return new ModelAndView("search/result2");  
	}
	
//	private void setModel(Model model, HttpSession session, String uId) {
//		String userId = String.valueOf(uId);
//		String[] userDetails = ud.getDetailsById(userId).replaceAll("null", "-").split(",");
//		String udID = userDetails[0];
//		
//		model.addAttribute("f", userDetails[1].charAt(0));
//		model.addAttribute("l", userDetails[2].charAt(0));
//		
//		model.addAttribute("firstName", userDetails[1]);
//		model.addAttribute("lastName", userDetails[2]);
//		
//		model.addAttribute("fullName", userDetails[1] + " " + userDetails[2]);
//		
//		if (userDetails.length >= 4) {
//			
//		}
//		model.addAttribute("headline", userDetails[3]);
//		model.addAttribute("about", userDetails[4]);
//		model.addAttribute("phone", userDetails[5]);
//		model.addAttribute("company", userDetails[6]);
//		model.addAttribute("email", session.getAttribute("email"));
//
//		model.addAttribute("city", userDetails[7]);
//		model.addAttribute("country", userDetails[8]);
//		
//		// experiences
//		model.addAttribute("ex", exs.getExperiencesByUserDetailsId(udID)); // Experiences[]
//		
//		// educations
//		model.addAttribute("ed", eds.getEducationsByUserDetailsId(udID)); // Educations[]
//		
//	}
	
	private void setModel(Model model, HttpSession session, String uId) {
		String userId = String.valueOf(uId);
		String[] userDetails = ud.getDetailsById(userId).replaceAll("null", "-").split(",");
		String udID = userDetails[0];
		
		model.addAttribute("f", userDetails[1].charAt(0));
		model.addAttribute("l", userDetails[2].charAt(0));
		
		model.addAttribute("firstName", userDetails[1]);
		model.addAttribute("lastName", userDetails[2]);
		
		model.addAttribute("fullName", userDetails[1] + " " + userDetails[2]);
		
		if (userDetails.length >= 4) {
			model.addAttribute("headline", userDetails[3]);
		}
		if (userDetails.length >= 5) {
			model.addAttribute("about", userDetails[4]);
		}
		if (userDetails.length >= 6) {
			model.addAttribute("phone", userDetails[5]);
		}
		if (userDetails.length >= 7) {
			model.addAttribute("company", userDetails[6]);
		}
		if (userDetails.length >= 8) {
			model.addAttribute("city", userDetails[7]);
		}
		if (userDetails.length >= 9) {
			model.addAttribute("country", userDetails[8]);
		}
		model.addAttribute("email", session.getAttribute("email"));


		
		// experiences
		model.addAttribute("ex", exs.getExperiencesByUserDetailsId(udID)); // Experiences[]
		
		// educations
		model.addAttribute("ed", eds.getEducationsByUserDetailsId(udID)); // Educations[]
		
	}
}
