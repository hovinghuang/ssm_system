package com.ssm.mapper;

import com.ssm.pojo.Like;
import com.ssm.pojo.LikeExample;
import java.util.List;

public interface LikeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Like record);

    int insertSelective(Like record);

    List<Like> selectByExample(LikeExample example);

    Like selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Like record);

    int updateByPrimaryKey(Like record);
}