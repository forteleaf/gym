package com.gym.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.app.dto.MsgDto;

@Repository
public class MsgDao {
	@Autowired private SqlSession sqlSession;
	private final String NS = "gym.user.MsgMapper";
	
	public int insert(MsgDto dto){
		return sqlSession.insert(NS +".insert",dto);
	}

	public List<MsgDto> list() {
		return sqlSession.selectList(NS+ ".list");
	}

	public List<MsgDto> userlist(String pid) {
		return sqlSession.selectList(NS + ".userlist", pid);
	}

	public int countMsg(String pid) {
		return sqlSession.selectOne(NS + ".countmsg", pid);
	}

	public int changeRead(String num) {
		return sqlSession.update(NS+".changeread", num);
	}

	public int delete(int num) {
		return sqlSession.delete(NS+".delete",num);
	}

	
}
