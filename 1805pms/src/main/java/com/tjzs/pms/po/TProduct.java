package com.tjzs.pms.po;

import java.io.Serializable;
import java.util.Date;

public class TProduct implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -404544639760082023L;

	private int id;
	private String pname; //商品名
	private int brand; //品牌
	private double weight; //重量
	private int isnew; //是否新品
	private int ishot; //是否热销
	private int isrecommend; //是否推荐
	private int ptype; //商品类别
	private String creator; //新增人
	private Date createtime; //新增时间
	private int chktor; //审核人
	private Date chktime; //审核时间
	private int updator; //修改人
	private Date updatetime; //修改时间
	private int status; //状态
	private String fromarea; //产地
	private String discribe; //描述
	private String packlist; //包装清单
	private String features; //属性集
	private String colors; //颜色集
	private String sizes; //尺码集
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getBrand() {
		return brand;
	}
	public void setBrand(int brand) {
		this.brand = brand;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public int getIsnew() {
		return isnew;
	}
	public void setIsnew(int isnew) {
		this.isnew = isnew;
	}
	public int getIshot() {
		return ishot;
	}
	public void setIshot(int ishot) {
		this.ishot = ishot;
	}
	public int getIsrecommend() {
		return isrecommend;
	}
	public void setIsrecommend(int isrecommend) {
		this.isrecommend = isrecommend;
	}
	public int getPtype() {
		return ptype;
	}
	public void setPtype(int ptype) {
		this.ptype = ptype;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public int getChktor() {
		return chktor;
	}
	public void setChktor(int chktor) {
		this.chktor = chktor;
	}
	public Date getChktime() {
		return chktime;
	}
	public void setChktime(Date chktime) {
		this.chktime = chktime;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getFromarea() {
		return fromarea;
	}
	public void setFromarea(String fromarea) {
		this.fromarea = fromarea;
	}
	public String getDiscribe() {
		return discribe;
	}
	public void setDiscribe(String discribe) {
		this.discribe = discribe;
	}
	public String getPacklist() {
		return packlist;
	}
	public void setPacklist(String packlist) {
		this.packlist = packlist;
	}
	public String getFeatures() {
		return features;
	}
	public void setFeatures(String features) {
		this.features = features;
	}
	public String getColors() {
		return colors;
	}
	public void setColors(String colors) {
		this.colors = colors;
	}
	public String getSizes() {
		return sizes;
	}
	public void setSizes(String sizes) {
		this.sizes = sizes;
	}

	
	
}
