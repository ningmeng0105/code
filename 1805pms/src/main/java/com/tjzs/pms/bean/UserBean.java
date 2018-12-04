package com.tjzs.pms.bean;

public class UserBean {
//	id
		private int id;
//		登录名
		private String loginname;
//		密码
		private String password;
//		真实姓名
		private String realname;
//		性别
		private String sex;
//		生日
		private String birthday;
//		邮箱
		private String email;
//		所属部门
		private int dept;
//		是否可用
		private int enable;
//		创建人
		private int creatman;
//		是否可用文本
		private String enableTXT;
//		部门名称
		private String deptname;
		

//		给所有属性添加setter和getter
		public String getEnableTXT() {
			return enableTXT;
		}
		public void setEnableTXT(String enableTXT) {
			this.enableTXT = enableTXT;
		}
		public String getDeptname() {
			return deptname;
		}
		public void setDeptname(String deptname) {
			this.deptname = deptname;
		}
		public int getEnable() {
			return enable;
		}
		public void setEnable(int enable) {
			this.enable = enable;
		}
		public int getCreatman() {
			return creatman;
		}
		public void setCreatman(int creatman) {
			this.creatman = creatman;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getLoginname() {
			return loginname;
		}
		public void setLoginname(String loginname) {
			this.loginname = loginname;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getRealname() {
			return realname;
		}
		public void setRealname(String realname) {
			this.realname = realname;
		}
		public String getSex() {
			return sex;
		}
		public void setSex(String sex) {
			this.sex = sex;
		}
		public String getBirthday() {
			return birthday;
		}
		public void setBirthday(String birthday) {
			this.birthday = birthday;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public int getDept() {
			return dept;
		}
		public void setDept(int dept) {
			this.dept = dept;
		}
			
}
