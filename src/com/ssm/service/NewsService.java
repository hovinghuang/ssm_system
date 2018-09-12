package com.ssm.service;

import java.util.List;
import java.util.Map;

import com.ssm.pojo.Comment;
import com.ssm.pojo.Like;
import com.ssm.pojo.News;

public interface NewsService {

	public List<News> list();

	public void add(News news);

	public void delete(int id);

	public News get(int id);

	public void update(News news);

	public int total();

	public List<News> searchNewsByKey(String key);

	public List<News> findNewsByTime(Map map);

	public Like getLike(Map map);

	public void addLike(Like like);

	public void updateLikeById(Like like);

	public int likeTotal(int news_id);

	public void addComment(Comment comment);

	public List<Comment> getComment(int news_id);

}
