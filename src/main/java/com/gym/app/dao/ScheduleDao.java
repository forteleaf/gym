package com.gym.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.app.dto.ScheduleDto;
import com.gym.app.dto.ScheduleUpdateDto;

@Repository
public class ScheduleDao {
	@Autowired private SqlSession sqlSession;
	private final String NS="gym.user.ScheduleMapper";
	public List<ScheduleDto> slist(){
		return sqlSession.selectList(NS+".slist");
	}
	public int insert(ScheduleDto dto){
		return sqlSession.insert(NS+".insert", dto);
	}
	public List<ScheduleDto> select(String iid){
		return sqlSession.selectList(NS+".select",iid);
	}
	public List<ScheduleDto> memberSelect(String id){
		return sqlSession.selectList(NS+".memberSelect",id);
	}
	public int getGrade(String id){
		return sqlSession.selectOne(NS+".getGrade", id);
	}
	public int getInstructor(String id){
		return sqlSession.selectOne(NS+".getInstructor", id);
	}
	public int update(ScheduleUpdateDto dto){
		return sqlSession.update(NS+".update", dto);
	}
	public List<String> getBestInstructor() {
		return sqlSession.selectList(NS+".bestInstructor");
	}
}