package com.stj.tunnel.BlackLizard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.stj.tunnel.BlackLizard.dto.Article;

@Mapper
public interface ArticleDao {
	List<Article> getArticles();
}
