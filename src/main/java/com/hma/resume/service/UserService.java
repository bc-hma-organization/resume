package com.hma.resume.service;

import com.hma.resume.domain.User;
import com.hma.resume.dto.Result;
import com.hma.resume.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户服务层
 */
@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	/**
	 * 登陆密码判断
	 * @param username
	 * @param password
	 * @return
	 */
	public Result<User> checkPassword(String username, String password) {
		Result<User> result = new Result();
		User user = this.userRepository.findByUserName(username);
		if(user == null) {
			result.setSuccess(false);
			result.setMessage("此用户不存在，请输入正确的用户名！");
		}else if(user.getPassword().equals(password)){
			result.setSuccess(true);
			result.setMessage("验证通过！");
			result.setData(user);
		}else{
			result.setSuccess(false);
			result.setMessage("密码或用户名错误！");
		}
		return result;
	}

	/**
	 * 保存注册信息
	 * @param user
	 * @return
	 */
	public Result saveRegister(User user){
		Result result = new Result();
		if(user == null){
			result.setMessage("注册失败");
		}else if(null == this.userRepository.findByUserName(user.getUserName())){
			result.setMessage("该用户名已存在");
		}else{
			result.setSuccess(true);
			result.setMessage("注册成功");
		}
		return result;
	}



	/**
	 * 根据单位查询用户数量（分页用）
	 * @param company
	 * @return int num
	 */
	public Integer findUserNumByCompany(String company){
		return this.userRepository.findUserNumByCompany(company);
	}

	/**
	 * 根据单位查询用户信息
	 * @param company 单位名称
	 * @param startIndex 开始记录
	 * @param indexNum 一页数量
	 * @return User list
	 */
	public List<User> findUserByCompany(String company, Integer startIndex, Integer indexNum){
		return this.userRepository.findUserByCompany(company, startIndex, indexNum);
	}

	public User findById(Integer id){
		return this.userRepository.findById(id);
	}
}
