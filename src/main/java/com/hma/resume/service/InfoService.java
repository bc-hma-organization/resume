package com.hma.resume.service;

import com.hma.resume.domain.Info;
import com.hma.resume.domain.User;
import com.hma.resume.dto.Result;
import com.hma.resume.repository.InfoRepository;
import com.hma.resume.repository.UserRepository;
import com.hma.resume.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
	 * @param infoIds
	 * @param status
	 */
	public Result updateStatusById(String infoIds, Integer status) {
		Result result = new Result();
		if (infoIds == null && status == 0) {
			result.setMessage("提交失败");
		} else {
			String[] arrId = infoIds.split(",");
			try {
				for (int i = 0; i < arrId.length; i++) {
					Info info = selectInfoById(Integer.parseInt(arrId[i]));
					info.setStatus(status);
					this.infoRepository.save(info);
				}
			} catch (Exception e) {
				System.out.println("错误为：" + e.toString());
			}
			result.setSuccess(true);
			result.setMessage("提交成功！");
		}
		return  result;
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
		this.infoRepository.save(info);
		result.setSuccess(true);
		result.setMessage("保存成功");
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

	/**
	 * 根据id查询信息
	 * @param id
	 * @return
	 */
	public Info selectInfoById(Integer id) {
		return this.infoRepository.findInfoById(id);
	}

	/**
	 * 分离学习信息
	 * @param infoList
	 * @return
	 */
	public List<Info> separateStudy(List<Info> infoList){
		ArrayList<Info> list = new ArrayList<Info>();
		for (int i=0; i<infoList.size(); i++){
			if (infoList.get(i).getEducation() != null){
				list.add(infoList.get(i));
			}
		}
		return list;
	}

	/**
	 * 分离工作信息
	 * @param infoList
	 * @return
	 */
	public List<Info> separateWork(List<Info> infoList){
		List<Info> list = new ArrayList<Info>();
		for (int i=0; i<infoList.size(); i++){
			if (infoList.get(i).getEducation() == null){
				list.add(infoList.get(i));
			}
		}
		return list;
	}
}
