package com.gym.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.gym.app.dto.InfoboardDto;




@Repository
public class InfoboardDao {
	@Autowired private SqlSession sqlSession;
	private final String NS="gym.user.InfoboardMapper";
	public int insert(InfoboardDto dto){
		return sqlSession.insert(NS+".insert",dto);
	}
	public List<InfoboardDto> plist(HashMap<String, Object> map){
		return sqlSession.selectList(NS+".plist", map);
	}
	public int getCount(HashMap<String, Object> map1){
		return sqlSession.selectOne(NS+".getCount",map1);
	}
	public InfoboardDto getInfo(int ifnum){
		return sqlSession.selectOne(NS+".getInfo", ifnum);
	}
	public InfoboardDto next(int ifnum){
		return sqlSession.selectOne(NS+".next", ifnum);
	}
	public InfoboardDto prev(int ifnum){
		return sqlSession.selectOne(NS+".prev", ifnum);
	}
	public int addHit(int ifnum) {
		return sqlSession.update(NS+".addHit",ifnum);
	}
	public int delete(int ifnum) {
		return sqlSession.delete(NS+".delete",ifnum);
	}
	public int update(InfoboardDto dto) {
		return sqlSession.update(NS+".update",dto);
	}
	public String getPic(String id){
		return sqlSession.selectOne(NS+".getPic", id);
	}
}
