package com.tjzs.pms.dao;

import java.util.List;

import com.tjzs.pms.po.TDep;

public interface DeptDao {

	public List<TDep> queryByPid(int pid);
}
