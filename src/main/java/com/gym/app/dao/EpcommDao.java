package com.gym.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.app.dto.EpcommDto;
import com.sun.org.apache.regexp.internal.recompile;

@Repository
public class EpcommDao {
	@Autowired private SqlSession sqlSession;
	private final String NS="gym.user.EpcommMapper";
	public int insert(EpcommDto dto){
		int ecnum=dto.getEcnum();
		int ecref=dto.getEcref();
		
		int eclev=dto.getEclev();
		int ecstep=dto.getEcstep();
		String id=dto.getId();
		String comments=dto.getComments();
		int epnum=dto.getEpnum();
		int maxNum=sqlSession.selectOne(NS+".getMaxNum");
		if(ecnum==0){
			ecref=maxNum+1;
		}else{
			sqlSession.update(NS+".update1", dto);
			eclev=eclev+1;
			ecstep=ecstep+1;
			
		}
		ecnum=maxNum+1;
		
		EpcommDto dto1=new EpcommDto(ecnum, epnum, id, comments, ecref, eclev, ecstep,null);
		return sqlSession.insert(NS+".insert", dto1);
	}
	public int update(EpcommDto dto){
		return sqlSession.update(NS+".update", dto);
	}
	public List<EpcommDto> list(HashMap<String, Integer> map){
		return sqlSession.selectList(NS+".list", map);
	}
	public int getCount(int epnum){
		return sqlSession.selectOne(NS+".getCount1",epnum);
	}
	public int delete(int ecnum){
		return sqlSession.delete(NS+".delete",ecnum);
	}
	public String getPic(String id){
		return sqlSession.selectOne(NS+".getPic", id);
	}
}
