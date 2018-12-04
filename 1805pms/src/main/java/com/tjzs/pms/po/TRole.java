package com.tjzs.pms.po;

import java.io.Serializable;

public class TRole implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4202463675263703950L;

	private int id;
	private String rname;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	
	
}
