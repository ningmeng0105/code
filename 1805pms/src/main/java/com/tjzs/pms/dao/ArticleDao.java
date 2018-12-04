package com.tjzs.pms.dao;

import java.util.List;

import com.tjzs.pms.po.TArticle;
import com.tjzs.pms.vo.QueryArticle;

public interface ArticleDao {

	//通过条件查询 
		public 	List<TArticle> queryByCon(QueryArticle query);
		
		//查分页
		public 	List<TArticle> queryByPage(QueryArticle query);
		
		//通过主键查询
		public TArticle queryById(int id);
		
		//批量删除
		public void deleteByIds(int[] ids);
		
		//修改
		public void update(TArticle article);

		//新增
		public int insert(TArticle article);
		
		//删除
		public void delete(int id);
		
		//查询总数
		public int queryCount(QueryArticle query);
}
