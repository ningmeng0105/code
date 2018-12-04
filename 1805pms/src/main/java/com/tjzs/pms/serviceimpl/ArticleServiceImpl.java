package com.tjzs.pms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tjzs.pms.dao.ArticleDao;
import com.tjzs.pms.exception.AppException;
import com.tjzs.pms.po.TArticle;
import com.tjzs.pms.service.ArticleService;
import com.tjzs.pms.utils.Constants;
import com.tjzs.pms.vo.QueryArticle;
/**
 * 服务实现
 */
@Service
@Transactional  //该业务支持事物
public class ArticleServiceImpl implements ArticleService{
	@Autowired//注入UserDao接口
	private ArticleDao adao;
	
	

	@Override
	public List<TArticle> queryByCon(QueryArticle query) {
		// TODO Auto-generated method stub
		
		return adao.queryByCon(query);
	}


	@Override
	@Transactional(rollbackFor=Exception.class)
	public void deleteByIds(int[] ids) {
		// TODO Auto-generated method stub
		adao.deleteByIds(ids);
	}


	@Override
	@Transactional(rollbackFor=Exception.class)
	public void update(TArticle article) throws AppException {
		// TODO Auto-generated method stub
		
		adao.update(article);
	}


	@Override
	@Transactional(rollbackFor=Exception.class)
	public int insert(TArticle article) throws AppException{
		// TODO Auto-generated method stub
	
		//udao.insert(user);
		return adao.insert(article);
	}


	@Override
	@Transactional(rollbackFor=Exception.class)
	public void delete(int id) {
		// TODO Auto-generated method stub
		adao.delete(id);
	}


	@Override
	public TArticle queryById(int id) {
		// TODO Auto-generated method stub
		return adao.queryById(id);
	}

	/**
	 * query:条件 page：当前页
	 */
	@Override
	public List<TArticle> queryByPage(QueryArticle query, int page) {
		// TODO Auto-generated method stub
		//将当前页设置到条件中
		query.setPage(page);
		return adao.queryByPage(query);
	}

	/**
	 * 计算总页数
	 */
	@Override
	public int queryPageCount(QueryArticle query) {
		// TODO Auto-generated method stub
		//获得总条数
		int count=adao.queryCount(query);
		//根据能否整除计算总页数
		if (count%Constants.PAGECOUNT==0) {
			//返回计算出的总页数
			return count/Constants.PAGECOUNT;
		} else {
			return count/Constants.PAGECOUNT+1;
		}
		
	}


}
