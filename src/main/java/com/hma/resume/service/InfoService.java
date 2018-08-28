package com.hma.resume.service;

import com.hma.resume.domain.Info;
import com.hma.resume.domain.User;
import com.hma.resume.repository.InfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 信息服务层
 */
@Service
public class InfoService {

	@Autowired
	private InfoRepository infoRepository;

	public  List<Info> selectInfoByUserId(Integer userId){
		return this.infoRepository.findInfoByUserId(userId);
	}

	public void updateStatusById(Integer infoId,Integer status){
		this.infoRepository.updateStatusById(infoId,status);
	};
}
