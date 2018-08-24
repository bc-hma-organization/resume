package com.hma.resume.service;

import com.hma.resume.domain.User;
import com.hma.resume.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	public String checkPassword(String username, String password) {
		String message = "";
		User user = this.userRepository.findByUserName(username);
		if(user != null) {
			
		}
		return message;
	}
}
