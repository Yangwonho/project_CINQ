package com.project.root.join.service;



import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface JoinService {
	

	public String JoinSave(MultipartHttpServletRequest mul, HttpServletRequest request);

	public void myJoinView(String id, Model model);

}
   