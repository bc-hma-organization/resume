package com.hma.resume.service;

import com.hma.resume.domain.Info;
import com.hma.resume.domain.User;
import com.hma.resume.dto.Result;
import com.hma.resume.repository.InfoRepository;
import com.hma.resume.repository.UserRepository;
import com.hma.resume.util.DateUtil;
import com.hma.resume.util.StrToHex;
import org.bcos.evidence.app.BcosApp;
import org.bcos.evidence.sample.EvidenceData;
import org.bcos.evidence.web3j.Evidence;
import org.bcos.web3j.abi.datatypes.Address;
import org.bcos.web3j.abi.datatypes.Array;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.*;

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
	public Result updateStatusById(Integer userId, String infoIds, Integer status) {
		Result result = new Result();
		if (infoIds == null && status == 0) {
			result.setMessage("提交失败");
		} else {
			String[] arrId = infoIds.split(",");
			try {
				//根据传过来的一个或多个id修改状态
				for (int i = 0; i < arrId.length; i++) {
					Info info = selectInfoById(Integer.parseInt(arrId[i]));
					info.setStatus(status);
					this.infoRepository.save(info);
				}
			} catch (Exception e) {
				System.out.println("错误为：" + e.toString());
			}
			//判断该用户的信息是否全部认证通过
			if (isAllCertified(userId)){
				//通过则将信息上链
				//部署合约
				//String deployAddress = BlockChain.deploy();
				//信息上链
				//String upDataAddress = BlockChain.upDataToChain(deployAddress,getUpChainString(userId));
				//认证
				//BlockChain.send("arbitrator.jks","123456","123456",upDataAddress);
				//BlockChain.send("depositor.jks","123456","123456",upDataAddress);
				//System.out.println("上链中。。。。");
				//获取上传数据并拼接
				String evidenceHash = getUpChainString(userId);
				User user = this.userRepository.findById(userId);
				BcosApp app = new BcosApp();
				try{
					boolean config = app.loadConfig();
					//部署工厂合约
					Address address = app.deployContract("user.jks", "123456", "123456");
					//数据上链
					Address chainAddress = app.newEvidence("user.jks", "123456", "123456", address.toString(), userId.toString(), evidenceHash);
					//保存合约地址
					user.setChainAddress(chainAddress.toString());
				}catch (Exception e){
					e.printStackTrace();
				}
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
			if (infoList.get(i).getType() == 0){
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
			if (infoList.get(i).getType() == 1){
				list.add(infoList.get(i));
			}
		}
		return list;
	}

	/**
	 * 根据用户获得数据，并把数据转换成特定hex格式
	 * @param userId
	 * @return hex格式字符串
	 */
	public String getUpChainString(Integer userId){
		String upChainString = "";
		User user = this.userRepository.findById(userId);
		List<Info> infos = this.infoRepository.findInfoByUserId(userId);

		upChainString += user.getId() + ",";
		upChainString += user.getTrueName() + ",";
		upChainString += user.getSex() + ",";
		upChainString += user.getAge() + ",";
		upChainString += user.getAddress() + ",";
		upChainString += user.getPhone() + ",";
		upChainString += user.getEmail() + ",";
		upChainString += user.getPicture() + ",";
		upChainString += user.getIdentityCard() + ";";
		for (int i = 0; i < infos.size(); i++) {
			upChainString += infos.get(i).getStartTime() + ",";
			upChainString += infos.get(i).getEndTime() + ",";
			upChainString += infos.get(i).getCompany() + ",";
			if (infos.get(i).getPosition().length() == 0){
				infos.get(i).setPosition("无");
			}
			if(infos.get(i).getEducation().length() == 0){
				infos.get(i).setEducation("无");
			}
			if(infos.get(i).getDescription().length() == 0){
				infos.get(i).setDescription("无");
			}
			upChainString += infos.get(i).getPosition() + ",";
			upChainString += infos.get(i).getEducation() + ",";
			upChainString += infos.get(i).getDescription() + ";";
		}
		String hexString = StrToHex.encode(upChainString.getBytes());
		return "0x" + hexString;
	}

	/**
	 * 解析返回的user info 数组
	 * @param data
	 * @return
	 */
	public Map stringToPojoMap(String data){
		Map<String, Object> map = new HashMap<String, Object>();
		String []arr = data.split(";");
		String user = arr[0];
		String info = arr[1];
		String []userArray = user.split(",");
		String []infoArray = info.split(",");
		Map<String, Object> userMap = new HashMap<String, Object>();
		Map<String, Object> infoMap = new HashMap<String, Object>();

		userMap.put("id", userArray[0]);
		userMap.put("trueName", userArray[1]);
		userMap.put("sex", userArray[2]);
		userMap.put("age", userArray[3]);
		userMap.put("address", userArray[4]);
		userMap.put("phone", userArray[5]);
		userMap.put("email", userArray[6]);
		userMap.put("picture", userArray[7]);
		userMap.put("identityCard", userArray[8]);

		infoMap.put("startTime", infoArray[0]);
		infoMap.put("endTime", infoArray[1]);
		infoMap.put("company", infoArray[2]);
		infoMap.put("position", infoArray[3]);
		infoMap.put("education", infoArray[4]);
		infoMap.put("description", infoArray[5]);

		map.put("user", userMap);
		map.put("info", infoMap);
		return map;
	}

	/**
	 * 获取链上数据转化为POJOMap
	 * @param user
	 * @return
	 */
	public Map getChainDataToPOJO(User user){
		Map map = new HashMap();
		String chainAddress = "";
		if(user.getChainAddress() == null || user.getChainAddress().equals("")){
			return map;
		}else{
			chainAddress = user.getChainAddress();
			try{
				BcosApp app = new BcosApp();
				boolean config = app.loadConfig();
				EvidenceData evidenceData = app.getEvidence("user.jks", "123456", "123456", user.getChainAddress());
				StrToHex code = new StrToHex();
				String hash = evidenceData.getEvidenceHash();
				hash = hash.substring(2, hash.length());
				String data = code.decode(hash);
				map = stringToPojoMap(data);
			}catch (Exception e){
				e.printStackTrace();
			}
		}
		return map;
	}

	/**
	 * 用来判断改用户的信息是否已经全部认证通过
	 * @param userId
	 * @return
	 */
	public boolean isAllCertified(Integer userId){
		boolean flag = true;
		List<Info> infos = this.infoRepository.findInfoByUserId(userId);
		for (int i = 0; i < infos.size(); i++) {
			if (infos.get(i).getStatus() != 1) {
				flag = false;
				break;
			}
		}
		return flag;
	}
}
