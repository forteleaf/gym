package com.gym.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.app.dto.DiaryDto;

@Repository
public class DiaryDao {
	@Autowired private SqlSession sqlSession;
	private final String NS = "gym.user.DiaryMapper";
	
	public int insert(DiaryDto dto){
		return sqlSession.insert(NS + ".insert" , dto);
	}
	public List<DiaryDto>select(){
		return sqlSession.selectList(NS + ".select");
	}
	public List<DiaryDto>selectid(String id){
		return sqlSession.selectList(NS + ".selectid",id);
	}
	public int delete(int d_num){
		return sqlSession.delete(NS + ".delete" ,d_num);
	}
	public int update(DiaryDto dto){
		return sqlSession.update(NS + ".update" ,dto);
	}
	public DiaryDto check(long start){
		return sqlSession.selectOne(NS + ".check" ,start);
	}
	public List<DiaryDto> count(String id){
		//System.out.println("dao:" + id);
		return sqlSession.selectList(NS + ".counts", id);
	}
	
	
}
