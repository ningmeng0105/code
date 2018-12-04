package com.tjzs.pms.vo;

import com.tjzs.pms.utils.Constants;

public class QueryPage {
/**
 * 分页对象
 */
	protected int start;//起始数
	protected int end;
	
	protected int page;

	public int getStart() {
		return (page-1)*Constants.PAGECOUNT+1;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return page*Constants.PAGECOUNT;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	
}
