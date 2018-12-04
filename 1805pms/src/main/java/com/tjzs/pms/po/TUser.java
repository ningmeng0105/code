package com.tjzs.pms.po;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.tjzs.pms.utils.DateUtil;

public class TUser implements Serializable{

	/**
	 * 网络唯一标识
	 */
	private static final long serialVersionUID = -8741163282569310664L;
	
	private int id;
	private String loginname; //登录名
	private String password; //密码
	private String sex; //性别
	private Date birthday; //生日
	private String email; //邮箱
	
	private TDep dept;//关联对象 一对一
	
	private String realname; //真实姓名
	private int isenabled; //是否可用
	private String enabletxt; //是否可用文本显示，用在jsp显示中
	private int creator; //创建人
	private Date createtime; //创建时间
	private int updator; //修改人
	private Date updatetime; //修改时间
	private String picurl; //图片路径
	private String birthdayTxt; //生日 jsp中显示文本
	
	
	private List<TPermission> permissions;//关联权限列表
	//左侧菜单，由permissions整理出来
	private List<TPermission> menu=new ArrayList<>();
	
	
	public List<TPermission> getMenu() {
		//清空 防止刷新时重复出现
		menu.clear();
		for (TPermission per1 : permissions) {
			//一级菜单
			if (per1.getPid()==0) {
				//清空
				per1.getChildren().clear();
				//装载一级菜单下的二级菜单
				for (TPermission per2 : permissions) {
					//一级菜单的id等于二级菜单的pid
					//说明该权限是一级菜单的子权限
					if(per1.getId()==per2.getPid()){
						per1.getChildren().add(per2);
					}
				}
				//将装载好的一级菜单放入菜单中
				menu.add(per1);
			}
		}
		return menu;
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public TDep getDept() {
		return dept;
	}
	public void setDept(TDep dept) {
		this.dept = dept;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public int getUpdator() {
		return updator;
	}
	public void setUpdator(int updator) {
		this.updator = updator;
	}
	public Date getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	public String getPicurl() {
		return picurl;
	}
	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}
	
	public List<TPermission> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<TPermission> permissions) {
		this.permissions = permissions;
	}

	public int getIsenabled() {
		return isenabled;
	}

	public void setIsenabled(int isenabled) {
		this.isenabled = isenabled;
	}
	//根据isenabled的值判断页面显示的内容
	public String getEnabletxt() {
		if (isenabled==1) {
			return "可用";
		} else {
			return "不可用";
		}
		
	}

	//调用DateUtil的方法将日期格式转化成字符串格式
	public String getBirthdayTxt() {
		return DateUtil.getStrDate(birthday);
	}

	

	
	
	

}
