package com.hma.resume.service;

import com.hma.resume.repository.OrganizationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrganizationService {

	@Autowired
	private OrganizationRepository organizationRepository;
}
