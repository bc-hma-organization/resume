package com.hma.resume.repository;

import com.hma.resume.domain.User;
import org.springframework.data.repository.CrudRepository;



public interface UserRepository extends CrudRepository<User, Integer>{
	
	/**
	 * 根据用户名查找记录
	 * @param username
	 * @return
	 */
	User findByUserName(String username);
}
