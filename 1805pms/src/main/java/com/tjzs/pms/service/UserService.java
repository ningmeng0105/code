package com.tjzs.pms.service;

import java.util.List;

import com.tjzs.pms.exception.AppException;
import com.tjzs.pms.po.TUser;
import com.tjzs.pms.vo.QueryUser;

public interface UserService {
	//登录
	public TUser chkLogin(QueryUser query) throws AppException;
	//按条件查询
	public List<TUser> queryByCon(QueryUser query);
	//批量删除
	public void deleteByIds(int[] ids);
	//修改
	public void update(TUser user) throws AppException;
	//新增
	public int insert(TUser user)throws AppException;
	//删除一条
	public void delete(int id);
	//获得一条
	public TUser queryById(int id);
	//查询分页
	public 	List<TUser> queryByPage(QueryUser query,int page);
	//获得总页数
	public int queryPageCount(QueryUser query);
}
