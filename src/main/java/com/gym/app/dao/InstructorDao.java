package com.gym.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.app.dto.InstructorDto;

@Repository
public class InstructorDao {
	@Autowired private SqlSession sqlSession;
	public final String NS="gym.user.InstructorMapper";
	public int iinsert(InstructorDto dto){
		return sqlSession.insert(NS + ".iinsert",dto);
	}
	public List<InstructorDto> ilist(){
		return sqlSession.selectList(NS + ".ilist");
	}
	public InstructorDto seltrain(String id){
		return sqlSession.selectOne(NS + ".seltrain", id);
	}
	public int deltrain(HashMap<String, Object> map){
		return sqlSession.update(NS + ".deltrain", map);
	}
	public int reinsert(InstructorDto dto){
		return sqlSession.update(NS + ".reinsert", dto);
	}
	public int update(InstructorDto dto){
		return sqlSession.update(NS + ".update", dto);
	}
	public int idelete(int inum){
		return sqlSession.delete(NS + ".idelete",inum);
	}
	public int iupdate(InstructorDto dto){
		return sqlSession.update(NS + ".iupdate",dto);
	}
	public InstructorDto idetail(int inum){
		return sqlSession.selectOne(NS + ".idetail",inum);
	}
	public int infoupdate(HashMap<String, String> map){
		return sqlSession.update(NS + ".infoupdate" ,map);
	}
}