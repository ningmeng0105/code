package com.tjzs.pms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tjzs.pms.dao.UserDao;
import com.tjzs.pms.dao.UserDao2;
import com.tjzs.pms.exception.AppException;
import com.tjzs.pms.po.TUser;
import com.tjzs.pms.service.UserService;
import com.tjzs.pms.utils.Constants;
import com.tjzs.pms.utils.MD5;
import com.tjzs.pms.vo.QueryUser;
/**
 * user服务实现
 */
@Service
@Transactional  //该业务支持事物
public class UserServiceImpl implements UserService{

	@Autowired//注入UserDao接口
	private UserDao udao;
	
	@Override
	public TUser chkLogin(QueryUser query) throws AppException {
		// TODO Auto-generated method stub
		//根据是否可用字段判断用户是否能登录
		if (query.getIsenabled()==-1) {
			throw new AppException(1001, "该用户身份已失效，不可登陆");
		}
		//将明码变成密码
		MD5 md5=new MD5();
		//加密后的密码
		String p1=md5.getMD5ofStr(query.getPassword());
		//将密码放到query中
		query.setPassword(p1);
	
		List<TUser> list=udao.queryByCon(query);
		if (list==null||list.size()!=1) {
			throw new AppException(1000, "用户名或密码错误，请重新输入");
		}else if (list.get(0).getIsenabled()==-1) {
			throw new AppException(1001, "该用户身份已失效，不可登陆");
		}
		
	
		//获得第一条
		TUser user=list.get(0);
		//返回第一条
		return udao.queryById(user.getId());
	}


	@Override
	public List<TUser> queryByCon(QueryUser query) {
		// TODO Auto-generated method stub
		//将明码变成密码
		MD5 md5=new MD5();
		//加密后的密码
		String p1=md5.getMD5ofStr(query.getPassword());
		//将密码放到query中
		query.setPassword(p1);
		return udao.queryByCon(query);
	}


	@Override
	@Transactional(rollbackFor=Exception.class)
	public void deleteByIds(int[] ids) {
		// TODO Auto-generated method stub
		udao.deleteByIds(ids);
	}


	@Override
	@Transactional(rollbackFor=Exception.class)
	public void update(TUser user) throws AppException {
		// TODO Auto-generated method stub
		//获得原来的用户
		TUser ouser=udao.queryById(user.getId());
		//原密码不等于新密码才加密
		if (user.getPassword()!=null&&!"".equals(user.getPassword())&&!user.getPassword().equals(ouser.getPassword())) {
			//将明码变成密码
			MD5 md5=new MD5();
			//加密后的密码 放到query中
			user.setPassword(md5.getMD5ofStr(user.getPassword()));
		}
	
		udao.update(user);
	}


	@Override
	@Transactional(rollbackFor=Exception.class)
	public int insert(TUser user) throws AppException{
		// TODO Auto-generated method stub
		if (user.getPassword()!=null&&!"".equals(user.getPassword())) {
			//将明码变成密码
			MD5 md5=new MD5();
			//加密后的密码 放到query中
			user.setPassword(md5.getMD5ofStr(user.getPassword()));
		}
		
		//udao.insert(user);
		return udao.insert(user);
	}


	@Override
	@Transactional(rollbackFor=Exception.class)
	public void delete(int id) {
		// TODO Auto-generated method stub
		udao.delete(id);
	}


	@Override
	public TUser queryById(int id) {
		// TODO Auto-generated method stub
		return udao.queryById(id);
	}

	/**
	 * query:条件 page：当前页
	 */
	@Override
	public List<TUser> queryByPage(QueryUser query, int page) {
		// TODO Auto-generated method stub
		//将当前页设置到条件中
		query.setPage(page);
		return udao.queryByPage(query);
	}

	/**
	 * 计算总页数
	 */
	@Override
	public int queryPageCount(QueryUser query) {
		// TODO Auto-generated method stub
		//获得总条数
		int count=udao.queryCount(query);
		//根据能否整除计算总页数
		if (count%Constants.PAGECOUNT==0) {
			//返回计算出的总页数
			return count/Constants.PAGECOUNT;
		} else {
			return count/Constants.PAGECOUNT+1;
		}
		
	}


}
