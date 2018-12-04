package com.tjzs.pms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjzs.pms.dao.DeptDao;
import com.tjzs.pms.po.TDep;
import com.tjzs.pms.service.DeptService;
@Service //实现服务
public class DeptServiceImpl implements DeptService {

@Autowired
 DeptDao dao;
	@Override
	public List<TDep> queryByPid(int pid) {
		// TODO Auto-generated method stub
		return dao.queryByPid(pid);
	}

}
