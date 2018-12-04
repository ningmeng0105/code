package com.tjzs.pms.po;

import java.io.Serializable;
import java.util.Date;

public class TArticle implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5892026480575001044L;
	
	private int id;
	private String tittle;
	private String content;
	private String author;
	
	private TChannel channel;//关联对象 一对一
	
	private int isremand;
	private int ishot;
	private Date createtime;
	private int createman;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTittle() {
		return tittle;
	}
	public void setTittle(String tittle) {
		this.tittle = tittle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public TChannel getChannel() {
		return channel;
	}
	public void setChannel(TChannel channel) {
		this.channel = channel;
	}
	public int getIsremand() {
		return isremand;
	}
	public void setIsremand(int isremand) {
		this.isremand = isremand;
	}
	public int getIshot() {
		return ishot;
	}
	public void setIshot(int ishot) {
		this.ishot = ishot;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public int getCreateman() {
		return createman;
	}
	public void setCreateman(int createman) {
		this.createman = createman;
	}
	
	
	
}
