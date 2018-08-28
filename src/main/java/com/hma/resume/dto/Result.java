package com.hma.resume.dto;

public class Result<T>{
	
	/**
	 * 结果
	 */
	private Boolean success = false;
	
	/**
	 * 消息
	 */
	private String message;
	
	/**
	 * 返回的数据
	 */
	private T data;

	public Boolean getSuccess() {
		return success;
	}

	public void setSuccess(Boolean success) {
		this.success = success;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public Result() {
		this.success = false;
	}
	
	/**
	 * 设置返回的结果
	 * @param success 成功则true
	 * @param message 需要返回的信息
	 */
	public Result(Boolean success, String message) {
		this.setSuccess(success);
		this.setMessage(message);
	}

	/**
	 * 设置含实体的结果
	 * @param success
	 * @param message
	 * @param data
	 */
	public Result(Boolean success, String message, T data){
		this.setSuccess(success);
		this.setMessage(message);
		this.setData(data);
	}
}
