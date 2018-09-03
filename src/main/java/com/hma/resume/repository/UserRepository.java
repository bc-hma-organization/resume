package com.hma.resume.repository;

import com.hma.resume.domain.User;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * 用户持久层
 */
@Repository
public interface UserRepository extends CrudRepository<User, Integer>, JpaSpecificationExecutor<User> {

	/**
	 * 根据用户名查找记录
	 *
	 * @param username
	 * @return
	 */
	User findByUserName(String username);

	/**
	 * 根据id查询记录
	 * @param id
	 * @return
	 */
	User findById(Integer id);

	/**
	 * 根据单位查询用户数量（分页用）
	 * @param companyKey
	 * @return
	 */
	@Query(value = "select count(u.ID) FROM user u,info i WHERE u.ID = i.userID AND i.companyKey = ?1", nativeQuery = true)
	Integer findUserNumByCompanyKey(String companyKey);

	/**
	 * 根据单位查询用户信息
	 * @param companyKey 单位码
	 * @param startIndex 开始记录
	 * @param indexNum 一页数量
	 * @return
	 */
	//@Query(value = "SELECT u.ID,u.turename,u.sex,u.age,u.phone,u.identityCard FROM user u INNER JOIN info i ON u.id = i.userID where i.company = ?1", nativeQuery = true)
	@Query(value = "select u.* FROM user u,info i WHERE u.ID = i.userID AND i.companyKey = ?1 order by CASE i.status WHEN 0 THEN 1 ELSE 2 END LIMIT ?2,?3", nativeQuery = true)
	List<User> findUserByCompanyKey(String companyKey, Integer startIndex, Integer indexNum);
}

