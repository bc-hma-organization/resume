package com.hma.resume.service;

import com.hma.resume.domain.Info;
import com.hma.resume.domain.User;
import com.hma.resume.dto.Result;
import com.hma.resume.repository.InfoRepository;
import com.hma.resume.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 信息服务层
 */
@Service
public class InfoService {

	@Autowired
	private InfoRepository infoRepository;

	@Autowired
    private UserService userService;

	@Autowired
	private UserRepository userRepository;

    /**
     * 根据用户id查找信息
     * @param userId
     * @return
     */
	public  List<Info> selectInfoByUserId(Integer userId){
		return this.infoRepository.findInfoByUserId(userId);
	}

	/**
	 * 修改信息状态
	 * @param infoId
	 * @param status
	 */
	public void updateStatusById(Integer infoId,Integer status){
		this.infoRepository.updateStatusById(infoId,status);
	}

	/**
	 * 保存上传的信息
	 * @param info
	 * @param session
	 * @return
	 */
	public Result saveInfo(Info info, HttpSession session){
		Result result = new Result();
		//获取当前用户session中的用户名
		String username = session.getAttribute("username").toString();
		User user = this.userRepository.findByUserName(username);
		//设置info表里的userid
		info.setUserId(user.getId());
		try{
			this.infoRepository.save(info);
			result.setSuccess(true);
			result.setMessage("保存成功");
		}catch (Exception e){
			System.out.println(e.toString());
		}
		return result;
	}

    /**
     * 获取当前用户的信息
     * @param session
     * @return
     */
	public User getCurrentUser(HttpSession session){
	    String username = session.getAttribute("username").toString();
	    return this.userService.findByUserName(username);
    }


}
