package com.ssm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.mapper.CommentMapper;
import com.ssm.mapper.LikeMapper;
import com.ssm.mapper.NewsMapper;
import com.ssm.pojo.Comment;
import com.ssm.pojo.Like;
import com.ssm.pojo.News;
import com.ssm.pojo.NewsExample;
import com.ssm.service.NewsService;

@Service
public class NewsServiceImpl implements NewsService {
	@Autowired
	NewsMapper newsMapper;
	@Autowired
	LikeMapper likeMapper;
	@Autowired
	CommentMapper commentMapper;

	@Override
	public List<News> list() {
		NewsExample example = new NewsExample();
		example.setOrderByClause("id asc");
		return newsMapper.selectByExample(example);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackForClassName = "Exception")
	public void add(News news) {
		newsMapper.insert(news);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackForClassName = "Exception")
	public void delete(int id) {
		newsMapper.deleteByPrimaryKey(id);
	}

	@Override
	public News get(int id) {
		return newsMapper.selectByPrimaryKey(id);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackForClassName = "Exception")
	public void update(News news) {
		newsMapper.updateByPrimaryKeySelective(news);
	}

	@Override
	public int total() {
		return newsMapper.total();
	}

	@Override
	public List<News> searchNewsByKey(String key) {
		return newsMapper.searchNewsByKey(key);
	}

	@Override
	public List<News> findNewsByTime(Map map) {
		return newsMapper.findNewsByTime(map);
	}

	@Override
	public void addLike(Like like) {
		likeMapper.insert(like);
	}

	@Override
	public void updateLikeById(Like like) {
		likeMapper.updateByPrimaryKey(like);
	}

	@Override
	public Like getLike(Map map) {
		return likeMapper.getLike(map);
	}

	@Override
	public int likeTotal(int news_id) {
		return likeMapper.total(news_id);
	}

	@Override
	public void addComment(Comment comment) {
		commentMapper.insert(comment);

	}

	@Override
	public List<Comment> getComment(int news_id) {
		return commentMapper.getComment(news_id);
	}

}
