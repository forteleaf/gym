package com.gym.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.app.dto.FbcommDto;
import com.sun.org.apache.regexp.internal.recompile;

@Repository
public class FbcommDao {
	@Autowired private SqlSession sqlSession;
	private final String NS="gym.user.FbcommMapper";
	public int insert(FbcommDto dto){
		int fcnum=dto.getFcnum();
		int fcref=dto.getFcref();
		
		int fclev=dto.getFclev();
		int fcstep=dto.getFcstep();
		String id=dto.getId();
		String comments=dto.getComments();
		int fbnum=dto.getFbnum();
		int maxNum=sqlSession.selectOne(NS+".getMaxNum");
		if(fcnum==0){
			fcref=maxNum+1;
		}else{
			sqlSession.update(NS+".update1", dto);
			fclev=fclev+1;
			fcstep=fcstep+1;
			
		}
		fcnum=maxNum+1;
		
		FbcommDto dto1=new FbcommDto(fcnum, fbnum, id, comments, fcref, fclev, fcstep,null);
		return sqlSession.insert(NS+".insert", dto1);
	}
	public int update(FbcommDto dto){
		return sqlSession.update(NS+".update", dto);
	}
	public List<FbcommDto> list(HashMap<String, Integer> map){
		return sqlSession.selectList(NS+".list", map);
	}
	public int getCount(int fbnum){
		return sqlSession.selectOne(NS+".getCount1",fbnum);
	}
	public int delete(int fcnum){
		return sqlSession.delete(NS+".delete",fcnum);
	}
	public String getPic(String id){
		return sqlSession.selectOne(NS+".getPic", id);
	}
}
