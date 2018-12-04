package com.tjzs.pms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.tjzs.pms.po.TUser;
import com.tjzs.pms.vo.QueryUser;
/**
 * 使用注解
 * 不需要xml
 * @author Administrator
 *
 */
@Repository //操作数据库
public interface UserDao2 {
	@Select("select * from tuser where loginname=#{loginname} and password=#{password}")
	public 	List<TUser> queryByCon(QueryUser query);
}
