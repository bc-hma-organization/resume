package com.hma.resume.service;

import com.hma.resume.domain.User;
import com.hma.resume.dto.Result;
import com.hma.resume.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
