package com.gym.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.app.dto.LockerDto;

@Repository
public class LockerDao {
	@Autowired private SqlSession sqlSession;
	public final String NS="gym.user.LockerMapper";
	public int linsert(LockerDto dto){
		return sqlSession.insert(NS + ".linsert",dto);
	}
	public List<LockerDto> llist(){
		return sqlSession.selectList(NS + ".llist");
	}
	public int ldelete(int lnum){
		return sqlSession.delete(NS + ".ldelete",lnum);
	}
	public int lupdate(LockerDto dto){
		return sqlSession.update(NS + ".lupdate",dto);
	}
	public LockerDto ldetail(int lnum){
		return sqlSession.selectOne(NS + ".ldetail",lnum);
	}
}