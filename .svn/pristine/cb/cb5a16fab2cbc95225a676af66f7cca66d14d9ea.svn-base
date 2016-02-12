package com.gym.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.app.dto.InsUserDto;

@Repository
public class InsUserDao {
	@Autowired private SqlSession sqlSession;
	public final String NS="gym.user.InsUserMapper";
	public List<InsUserDto> getinfo(){
		return sqlSession.selectList(NS + ".getinfo");
	}
}
