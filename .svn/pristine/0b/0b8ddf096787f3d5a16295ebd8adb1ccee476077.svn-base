package com.gym.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.app.dto.FboardDto;




@Repository
public class FboardDao {
	@Autowired private SqlSession sqlSession;
	private final String NS="gym.user.FboardMapper";
	public int insert(FboardDto dto){
		return sqlSession.insert(NS+".insert",dto);
	}
	public List<FboardDto> plist(HashMap<String, Object> map){
		return sqlSession.selectList(NS+".plist", map);
	}
	public int getCount(HashMap<String, Object> map1){
		return sqlSession.selectOne(NS+".getCount",map1);
	}
	public FboardDto getInfo(int fbnum){
		return sqlSession.selectOne(NS+".getInfo", fbnum);
	}
	public FboardDto next(int fbnum){
		return sqlSession.selectOne(NS+".next", fbnum);
	}
	public FboardDto prev(int fbnum){
		return sqlSession.selectOne(NS+".prev", fbnum);
	}
	public int addHit(int fbnum) {
		return sqlSession.update(NS+".addHit",fbnum);
	}
	public int delete(int fbnum) {
		return sqlSession.delete(NS+".delete",fbnum);
	}
	public int update(FboardDto dto) {
		return sqlSession.update(NS+".update",dto);
	}
	public String getPic(String id){
		return sqlSession.selectOne(NS+".getPic", id);
	}
}
