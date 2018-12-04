package com.tjzs.pms.service;

import java.util.List;

import com.tjzs.pms.po.TDep;

public interface DeptService {
	
	public List<TDep> queryByPid(int pid);

}
