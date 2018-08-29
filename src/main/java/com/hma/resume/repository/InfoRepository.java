package com.hma.resume.repository;

import com.hma.resume.domain.Info;
import com.hma.resume.domain.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 信息持久层
 */
@Repository
public interface InfoRepository extends CrudRepository<Info, Integer>{

    /**
     * 根据用户id查找信息
     * @param userId
     * @return
     */
    @Query(value = "SELECT * FROM info where userID = ?1", nativeQuery = true)
    List<Info> findInfoByUserId(Integer userId);

    //@Query(value = "update info set status = ?2 where infoId = ?1", nativeQuery = true)
    @Query(value = "update info set status = ?2 where ID = ?1", nativeQuery = true)
    void updateStatusById(Integer infoId, Integer status);



}
