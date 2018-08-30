package com.hma.resume.service;

import com.hma.resume.domain.Organization;
import com.hma.resume.repository.OrganizationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrganizationService {

	@Autowired
	private OrganizationRepository organizationRepository;

	public Organization findOrganizationById(Integer id){
		return  this.organizationRepository.findOrganizationById(id);
	}
}
