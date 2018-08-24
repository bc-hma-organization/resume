package com.hma.resume.service;

import com.hma.resume.domain.Info;
import com.hma.resume.domain.User;
import com.hma.resume.repository.InfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class InfoService {

	@Autowired
	private InfoRepository infoRepository;

	public List<User> selectInfoByCompany(String company){
		return this.infoRepository.findInfoByCompany(company);
	}

	public  List<Object> selectInfoByUserId(Integer userId){
		return this.infoRepository.findInfoByUserId(userId);
	}
}
