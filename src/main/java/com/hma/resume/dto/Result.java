package com.hma.resume.dto;

public class Result<T>{
	
	/**
	 * 结果
	 */
	private Boolean success;
	
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
	
	/**
	 * 设置返回的结果
	 * @param success 成功则true
	 * @param message 需要返回的信息
	 */
	public Result(Boolean success, String message) {
		this.setSuccess(success);
		this.setMessage(message);
	}
}
