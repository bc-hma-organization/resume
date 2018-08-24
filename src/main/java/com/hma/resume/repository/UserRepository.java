package com.hma.resume.repository;

import com.hma.resume.domain.User;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


/**
 * 用户持久层
 */
@Repository
public interface UserRepository extends CrudRepository<User, Integer>, JpaSpecificationExecutor<User> {
	
	/**
	 * 根据用户名查找记录
	 * @param username
	 * @return
	 */
	User findByUserName(String username);

	User findById(Integer id);
}
