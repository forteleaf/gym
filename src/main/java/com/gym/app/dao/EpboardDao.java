package com.gym.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.app.dto.EpboardDto;





@Repository
public class EpboardDao {
	@Autowired private SqlSession sqlSession;
	private final String NS="gym.user.EpboardMapper";
	public int insert(EpboardDto dto){
		return sqlSession.insert(NS+".insert",dto);
	}
	public List<EpboardDto> plist(HashMap<String, Object> map){
		return sqlSession.selectList(NS+".plist", map);
	}
	public int getCount(HashMap<String, Object> map1){
		return sqlSession.selectOne(NS+".getCount",map1);
	}
	public EpboardDto getInfo(int epnum){
		return sqlSession.selectOne(NS+".getInfo", epnum);
	}
	public EpboardDto next(int epnum){
		return sqlSession.selectOne(NS+".next", epnum);
	}
	public EpboardDto prev(int epnum){
		return sqlSession.selectOne(NS+".prev", epnum);
	}
	public int addHit(int epnum) {
		return sqlSession.update(NS+".addHit",epnum);
	}
	public int delete(int epnum) {
		return sqlSession.delete(NS+".delete",epnum);
	}
	public int update(EpboardDto dto) {
		return sqlSession.update(NS+".update",dto);
	}
	public String getPic(String id){
		return sqlSession.selectOne(NS+".getPic", id);
	}
}
