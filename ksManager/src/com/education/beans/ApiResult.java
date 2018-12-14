package com.education.beans;

public class ApiResult {

	int code;
	String msg;
	Object obj;
	Object objExt;
	
	public ApiResult(){}
	public Object getObj() {
		return obj;
	}
	public void setObj(Object obj) {
		this.obj = obj;
	}
	public ApiResult(int code, String msg){
		this.code = code;
		this.msg = msg;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getObjExt() {
		return objExt;
	}
	public void setObjExt(Object objExt) {
		this.objExt = objExt;
	}
	
}
