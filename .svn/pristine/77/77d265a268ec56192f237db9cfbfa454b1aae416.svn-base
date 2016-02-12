package com.gym.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.app.dto.ExerDto;


@Repository
public class ExerDao {
	@Autowired private SqlSession sqlSession;
	private final String NS = "gym.user.ExerMapper";
	
	public int insert(ExerDto dto){
		return sqlSession.insert(NS + ".insert", dto);
	}
	public List<ExerDto> allexerlist(){
		return sqlSession.selectList(NS + ".select");
	}
	public List<ExerDto> chooseexer(int exclass){
		return sqlSession.selectList(NS + ".chooseex", exclass);
	}
	public ExerDto exerdetail(int exnum){
		return sqlSession.selectOne(NS + ".exerdetail", exnum);
	}
	public int delete(int exnum){
		return sqlSession.delete(NS + ".delete", exnum);
	}
	public int update(ExerDto dto){
		return sqlSession.update(NS + ".update", dto);
	}
	public ExerDto getexer(String exname){
		return sqlSession.selectOne(NS + ".getexer", exname); 
	}
	

}
