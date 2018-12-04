package com.tjzs.pms.exception;

public class AppException extends Exception{
	//异常码
	private int code;
	//异常信息
	private String errMsg;
	/**
	 * 构造函数初始化
	 */
	public AppException(int code,String errMsg){
		this.code=code;
		this.errMsg=errMsg;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getErrMsg() {
		return errMsg;
	}
	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}
	
}
