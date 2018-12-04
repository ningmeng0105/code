package com.tjzs.pms.po;

import java.io.Serializable;

public class TChannel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8905928056583810367L;
	
	private int id;
	private String cname;
	private int pid;
	private int lev;
	private int isleaf;
	private int sort;
	private int createman;
	private int createtime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getIsleaf() {
		return isleaf;
	}
	public void setIsleaf(int isleaf) {
		this.isleaf = isleaf;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public int getCreateman() {
		return createman;
	}
	public void setCreateman(int createman) {
		this.createman = createman;
	}
	public int getCreatetime() {
		return createtime;
	}
	public void setCreatetime(int createtime) {
		this.createtime = createtime;
	}

	
}
