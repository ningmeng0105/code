package com.tjzs.pms.exception;
/**
 * 程序自定义异常类
 * @author Administrator
 *
 */
public class SysException extends Exception {
//	异常码
	private int errCode;
//	异常码信息
	private String errMsg;
	/**带参构造函数
 * @author Administrator
 *
 */
	public SysException(int errCode,String errMsg){
		this.errCode=errCode;
		this.errMsg=errMsg;
	}
	public int getErrCode() {
		return errCode;
	}
	public void setErrCode(int errCode) {
		this.errCode = errCode;
	}
	public String getErrMsg() {
		return errMsg;
	}
	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}
}
