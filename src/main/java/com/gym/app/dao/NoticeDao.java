package com.gym.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.app.dto.NoticeDto;


@Repository
public class NoticeDao {
	@Autowired private SqlSession sqlSession;
	private final String NS="gym.user.NoticeMapper";
	public int insert(NoticeDto dto){
		return sqlSession.insert(NS+".insert",dto);
	}
	public List<NoticeDto> nlist(HashMap<String, Object> map){
		return sqlSession.selectList(NS+".nlist", map);
	}
	public NoticeDto getInfo(int ntnum){
		return sqlSession.selectOne(NS+".getInfo", ntnum);
	}
	public int getCount(HashMap<String, Object> map1){
		return sqlSession.selectOne(NS+".getCount",map1);
	}
	public NoticeDto next(int ntnum){
		return sqlSession.selectOne(NS+".next", ntnum);
	}
	public NoticeDto prev(int ntnum){
		return sqlSession.selectOne(NS+".prev", ntnum);
	}
	public int addHit(int ntnum) {
		return sqlSession.update(NS+".addHit",ntnum);
	}
	public int delete(int ntnum) {
		return sqlSession.delete(NS+".delete",ntnum);
	}
	public int update(NoticeDto dto) {
		return sqlSession.update(NS+".update",dto);
	}
	public List<NoticeDto> alramNotice() {
		return sqlSession.selectList(NS+".alramnotice");
	}
	public String getPic(String id){
		return sqlSession.selectOne(NS+".getPic", id);
	}
}
