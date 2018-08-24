package com.hma.resume.repository;

import com.hma.resume.domain.Info;
import com.hma.resume.domain.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InfoRepository extends CrudRepository<Info, Integer>{

    @Query(value = "SELECT u.ID,u.turename,u.sex,u.age,u.phone,u.identityCard FROM user u INNER JOIN info i ON u.id = i.userID where i.company = ?1", nativeQuery = true)
    //@Query(value = "select * from info where company=?1", nativeQuery = true)
    List<User> findInfoByCompany(String company);

    //@Query("SELECT u.username FROM user u INNER JOIN info  i ON u.ID = i.userID where u.ID = ?1")
    List<Object> findInfoByUserId(Integer userId);
}
