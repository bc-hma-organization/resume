package com.hma.resume.service;

import com.hma.resume.domain.Organization;
import com.hma.resume.domain.User;
import com.hma.resume.dto.Result;
import com.hma.resume.repository.OrganizationRepository;
import com.hma.resume.repository.UserRepository;
import com.hma.resume.util.MD5Util;
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
		MD5Util md5 = new MD5Util();
		try{
		    password = md5.md5Encode(password);
        }catch (Exception e){
		    System.out.println(e.toString());
        }
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
		MD5Util md5 = new MD5Util();
		if(user == null){
			result.setMessage("注册失败");
		}else if(null != this.userRepository.findByUserName(user.getUserName())){
			result.setMessage("该用户名已注册");
		}else{
		    try{
		        //加密保存密码
		        user.setPassword(md5.md5Encode(user.getPassword()));
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
	    MD5Util md5 = new MD5Util();
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
            try{
                //加密保存密码
                user.setPassword(md5.md5Encode(user.getPassword()));
            }catch (Exception e){
                System.out.println(e.toString());
            }
            //保存机构信息
            this.organizationRepository.save(organization);
            Organization organizationSave = this.organizationRepository.findByOrganizaKey(organization.getOrganizaKey());
            //设置该用户为机构用户
            user.setOrganizationID(organizationSave.getId());
            user.setTrueName(organizationSave.getOrganizaName());
            this.userRepository.save(user);
            result.setSuccess(true);
            result.setMessage("注册成功");
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
	 * @param companyKey
	 * @return int num
	 */
	public Integer findUserNumByCompanyKey(String companyKey){
		return this.userRepository.findUserNumByCompanyKey(companyKey);
	}

	/**
	 * 根据单位查询用户信息
	 * @param conpanyKey 单位码
	 * @param startIndex 开始记录
	 * @param indexNum 一页数量
	 * @return User list
	 */
	public List<User> findUserByCompanyKey(String conpanyKey, Integer startIndex, Integer indexNum){
		return this.userRepository.findUserByCompanyKey(conpanyKey, startIndex, indexNum);
	}

    /**
     * 根据id查找用户
     * @param id
     * @return
     */
	public User findById(Integer id){
		return this.userRepository.findById(id);
	}

	/**
	 * 根据username查找用户
	 * @param username
	 * @return
	 */
	public User findByUserName(String username){
		return this.userRepository.findByUserName(username);
	}

	/**
	 * 保存用户信息
	 * @param user
	 * @return
	 */
	public Result updateUserInfo(User user){
		Result result = new Result();
		MD5Util md5 = new MD5Util();
		if(user.getId() == null){
			result.setMessage("保存失败，用户信息获取错误");
			return result;
		}
		//根据id查找数据库对应的用户
		/*User checkUser = this.userRepository.findById(user.getId());
		try{
		    //加密密码
		    user.setPassword(md5.md5Encode(user.getPassword()));
		    newPassword = md5.md5Encode(newPassword);
        }catch (Exception e){
		    System.out.println(e.toString());
        }
		//判断输入的原密码与数据库密码是否相同
		if(!user.getPassword().equals(checkUser.getPassword())){
			result.setMessage("原密码错误");
			return result;
		}else {
			user.setPassword(newPassword);
		}*/
		try{
			this.userRepository.save(user);
			result.setSuccess(true);
			result.setMessage("保存成功");
		}catch (Exception e){
			System.out.println(e.toString());
		}
		return result;
	}
}
