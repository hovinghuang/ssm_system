package com.ssm.mapper;

import java.util.List;

import com.ssm.pojo.Comment;
import com.ssm.pojo.CommentExample;

public interface CommentMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Comment record);

	int insertSelective(Comment record);

	List<Comment> selectByExample(CommentExample example);

	Comment selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Comment record);

	int updateByPrimaryKey(Comment record);

	List<Comment> getComment(int news_id);
}