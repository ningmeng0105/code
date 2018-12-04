package com.tjzs.pms.service;

import java.util.List;

import com.tjzs.pms.exception.AppException;
import com.tjzs.pms.po.TArticle;
import com.tjzs.pms.vo.QueryArticle;

public interface ArticleService {
		//按条件查询
		public List<TArticle> queryByCon(QueryArticle query);
		//批量删除
		public void deleteByIds(int[] ids);
		//修改
		public void update(TArticle article) throws AppException;
		//新增
		public int insert(TArticle article)throws AppException;
		//删除一条
		public void delete(int id);
		//获得一条
		public TArticle queryById(int id);
		//查询分页
		public 	List<TArticle> queryByPage(QueryArticle query,int page);
		//获得总页数
		public int queryPageCount(QueryArticle query);

}
