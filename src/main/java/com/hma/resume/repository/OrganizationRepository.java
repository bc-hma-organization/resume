package com.hma.resume.repository;

import com.hma.resume.domain.Organization;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * 机构持久层
 */
@Repository
public interface OrganizationRepository extends CrudRepository<Organization, Integer>{

    /**
     * 根据机构key查找一条记录
     * @param organizaKey
     * @return
     */
    Organization findByOrganizaKey(String organizaKey);
}
