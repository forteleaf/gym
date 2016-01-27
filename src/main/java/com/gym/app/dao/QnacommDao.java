package com.gym.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.app.dto.QnacommDto;
import com.sun.org.apache.regexp.internal.recompile;

@Repository
public class QnacommDao {
	@Autowired private SqlSession sqlSession;
	private final String NS="gym.user.QnacommMapper";
	public int insert(QnacommDto dto){
		int qcnum=dto.getQcnum();
		int qcref=dto.getQcref();
		int qclev=dto.getQclev();
		int qcstep=dto.getQcstep();
		String id=dto.getId();
		String comments=dto.getComments();
		int qnanum=dto.getQnanum();
		int maxNum=sqlSession.selectOne(NS+".getMaxNum");
		if(qcnum==0){
			qcref=maxNum+1;
		}else{
			sqlSession.update(NS+".update1", dto);
			qclev=qclev+1;
			qcstep=qcstep+1;
		}
		qcnum=maxNum+1;
		System.out.println("qcnum:"+qcnum);
		QnacommDto dto1=new QnacommDto(qcnum, qnanum, id, comments, qcref, qclev, qcstep,null);
		return sqlSession.insert(NS+".insert", dto1);
	}
	public int update(QnacommDto dto){
		return sqlSession.update(NS+".update", dto);
	}
	public List<QnacommDto> list(HashMap<String, Integer> map){
		return sqlSession.selectList(NS+".list", map);
	}
	public int getCount(int qnanum){
		return sqlSession.selectOne(NS+".getCount",qnanum);
	}
	public int delete(int qcnum){
		return sqlSession.delete(NS+".delete",qcnum);
	}
	public String getPic(String id){
		return sqlSession.selectOne(NS+".getPic", id);
	}
}
