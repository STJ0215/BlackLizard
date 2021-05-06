package com.stj.tunnel.blacklizard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.stj.tunnel.blacklizard.dto.Article;
import com.stj.tunnel.blacklizard.dto.Board;

@Mapper
public interface ArticleDao {
	Board getBoardByCode(@Param("boardCode") String boardCode);
	
	List<Article> getForPrintArticles(Map<String, Object> param);
	
	int getTotalCount(Map<String, Object> param);
	
	Article getForPrintArticleById(@Param("id") int id);
	
	void writeArticle(Map<String, Object> param);

	void modifyArticle(@Param("id") int id, @Param("title") String title, @Param("body") String body);
	
	void deleteArticleById(@Param("id") int id);
}
