package com.gym.app.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.app.dto.UserDto;

@Repository
public class UserDao {
	@Autowired private SqlSession sqlSession;
	private final String NS = "gym.user.UserMapper";
	
	public int insert(UserDto dto){
		return sqlSession.insert(NS + ".insert", dto);
	}
	public UserDto idcheck(String id){
		return sqlSession.selectOne(NS + ".idcheck",id);
	}
	public UserDto logincheck(HashMap<String, Object> map){
		return sqlSession.selectOne(NS + ".logincheck" ,map);
	}
	public int update1(UserDto dto){
		return sqlSession.update(NS + ".update1", dto);
	}
	public int update2(UserDto dto){
		return sqlSession.update(NS + ".update2", dto);
	}
	public List<UserDto> alluserlist(HashMap<String, Integer> map){
		return sqlSession.selectList(NS + ".alluserlist",map);
	}
	public List<UserDto> selectuserlist(HashMap<String, Integer> map){
		return sqlSession.selectList(NS + ".selectuserlist",map);
	}
	public int getallcnt(){
		return sqlSession.selectOne(NS + ".getallcnt" );
	}
	public int getlistcnt(int grade){
		return sqlSession.selectOne(NS + ".getlistcnt",grade );
	}
	public int gradeup(HashMap<String, Object> map){
		return sqlSession.update(NS + ".gradeup", map);
	}
	public List<UserDto> finduser(HashMap<String, String> map){
		return sqlSession.selectList(NS + ".finduser" ,map);
	}
	public int findcnt(HashMap<String, String> map){
		return sqlSession.selectOne(NS + ".findcnt" ,map);
	}
	public UserDto findnumuser(int num){
		return sqlSession.selectOne(NS + ".findnumuser" ,num);
	}
	public UserDto findprevuser(int num){
		return sqlSession.selectOne(NS + ".findprevuser" ,num);
	}
	public UserDto findnextuser(int num){
		return sqlSession.selectOne(NS + ".findnextuser" ,num);
	}
	public List<UserDto> alluserlistjson() {
		return sqlSession.selectList(NS+ ".alluserlistjson");
	}
	public int getGradeCnt(int grade) {
		return sqlSession.selectOne(NS+".getGradeCnt",grade);
	}
}
