package com.gym.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.app.dto.IfcommDto;
import com.sun.org.apache.regexp.internal.recompile;

@Repository
public class IfcommDao {
	@Autowired private SqlSession sqlSession;
	private final String NS="gym.user.IfcommMapper";
	public int insert(IfcommDto dto){
		int icnum=dto.getIcnum();
		int icref=dto.getIcref();
		
		int iclev=dto.getIclev();
		int icstep=dto.getIcstep();
		String id=dto.getId();
		String comments=dto.getComments();
		int ifnum=dto.getIfnum();
		int maxNum=sqlSession.selectOne(NS+".getMaxNum");
		if(icnum==0){
			icref=maxNum+1;
		}else{
			sqlSession.update(NS+".update1", dto);
			iclev=iclev+1;
			icstep=icstep+1;
			
		}
		icnum=maxNum+1;
		
		IfcommDto dto1=new IfcommDto(icnum, ifnum, id, comments, icref, iclev, icstep,null);
		return sqlSession.insert(NS+".insert", dto1);
	}
	public int update(IfcommDto dto){
		return sqlSession.update(NS+".update", dto);
	}
	public List<IfcommDto> list(HashMap<String, Integer> map){
		return sqlSession.selectList(NS+".list", map);
	}
	public int getCount(int ifnum){
		return sqlSession.selectOne(NS+".getCount",ifnum);
	}
	public int delete(int icnum){
		return sqlSession.delete(NS+".delete",icnum);
	}
	public String getPic(String id){
		return sqlSession.selectOne(NS+".getPic", id);
	}
}
