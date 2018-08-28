package com.hma.resume.service;

import com.hma.resume.domain.Organization;
import com.hma.resume.domain.User;
import com.hma.resume.dto.Result;
import com.hma.resume.repository.OrganizationRepository;
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

	@Autowired
    private OrganizationRepository organizationRepository;

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
	 * 保存人才注册信息
	 * @param user
	 * @return
	 */
	public Result saveRegister(User user){
		Result result = new Result();
		if(user == null){
			result.setMessage("注册失败");
		}else if(null != this.userRepository.findByUserName(user.getUserName())){
			result.setMessage("该用户名已注册");
		}else{
		    try{
		        this.userRepository.save(user);
            }catch (Exception e){
		        System.out.println(e.toString());
            }
			result.setSuccess(true);
			result.setMessage("注册成功");
		}
		return result;
	}

    /**
     * 保存机构注册信息
     * @param user
     * @param organization
     * @return
     */
    public Result saveOrgRegister(User user, Organization organization){
	    Result result = new Result();
	    //判断用户提交信息
	    if(user == null){
	        result.setMessage("请填写用户信息");
	        return result;
        }else if(null != this.userRepository.findByUserName(user.getUserName())){
	        result.setMessage("该用户名已注册");
	        return result;
        }
        //判断机构提交信息
        if(organization == null){
            result.setMessage("请填写机构信息");
        }else if(null != this.organizationRepository.findByOrganizaKey(organization.getOrganizaKey())){
            result.setMessage("该机构已被注册");
        }else{
            //保存机构信息
            Organization organizationSave = this.organizationRepository.save(organization);
            //设置该用户为机构用户
            user.setOrganizationID(organizationSave.getId());
            this.userRepository.save(user);
        }
	    return result;
    }

    /**
     * 查找机构key是否已被注册
     * @param organizationKey
     * @return
     */
    public Result checkOrganizationKey(String organizationKey){
        Result result = new Result();
        if(null != this.organizationRepository.findByOrganizaKey(organizationKey)){
            result.setMessage("该机构已被注册");
        }else{
            result.setMessage("机构码可用");
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

    /**
     * 根据id查找用户
     * @param id
     * @return
     */
	public User findById(Integer id){
		return this.userRepository.findById(id);
	}
}
