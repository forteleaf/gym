package com.gym.app.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.app.dto.UserDto;

@Repository
public class MailSenderDao {
	@Autowired private SqlSession sqlSession;
	private final String NS = "gym.user.MailSenderMapper";
	
	public UserDto sendmailcheck(HashMap<String, Object> map) {
		return sqlSession.selectOne(NS+".sendmailcheck", map);
	}
}
