package com.hma.resume.service;

import com.hma.resume.repository.InfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class InfoService {

	@Autowired
	private InfoRepository infoRepository;
}
