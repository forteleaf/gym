package com.gym.app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gym.app.dao.UserDao;
import com.gym.app.dto.UserDto;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Transactional
	@Override
	public int insert(UserDto dto) {
		return userDao.insert(dto);
	}

	@Override
	public UserDto idcheck(String id) {
		return userDao.idcheck(id);
	}

	@Override
	public UserDto logincheck(HashMap<String, Object> map) {
		// HashMap<String,Object> map1=userDao.logincheck(map);
		return userDao.logincheck(map);
	}

	@Override
	public List<UserDto> alluserlist(HashMap<String, Integer> map) {
		return userDao.alluserlist(map);
	}

	@Override
	public List<UserDto> selectuserlist(HashMap<String, Integer> map) {
		return userDao.selectuserlist(map);
	}

	@Override
	public int update1(UserDto dto) {
		return userDao.update1(dto);
	}

	@Override
	public int update2(UserDto dto) {
		return userDao.update2(dto);
	}

	@Override
	public int gradeup(HashMap<String, Object> map) {
		return userDao.gradeup(map);
	}

	@Override
	public int getallcnt() {
		return userDao.getallcnt();
	}

	@Override
	public int getlistcnt(int grade) {
		return userDao.getlistcnt(grade);
	}

	@Override
	public List<UserDto> finduser(HashMap<String, String> map) {
		return userDao.finduser(map);
	}

	@Override
	public int findcnt(HashMap<String, String> map) {
		return userDao.findcnt(map);
	}

	@Override
	public UserDto findnumuser(int num) {
		return userDao.findnumuser(num);
	}

	@Override
	public UserDto findprevuser(int num) {
		return userDao.findprevuser(num);
	}

	@Override
	public UserDto findnextuser(int num) {
		return userDao.findnextuser(num);
	}

	@Override
	public int delete(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(UserDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserDto getInfo(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserDto> alluserlistjson() {
		return userDao.alluserlistjson();
	}
	
@Override
	public int getGradeCnt(int grade) {
		return userDao.getGradeCnt(grade);
	}	

}
