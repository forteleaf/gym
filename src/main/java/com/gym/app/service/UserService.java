package com.gym.app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gym.app.dto.UserDto;

public interface UserService {
	int insert(UserDto dto);
	int delete(int num);
	int update(UserDto dto);
	UserDto getInfo(int num);
	UserDto idcheck(String id);
	UserDto logincheck(HashMap<String, Object> map);
	int update1(UserDto dto);
	int update2(UserDto dto);
	int gradeup(HashMap<String, Object> map);
	List<UserDto> alluserlist(HashMap<String, Integer> map);
	List<UserDto> selectuserlist(HashMap<String, Integer> map);
	int getallcnt();
	int getlistcnt(int grade);
	List<UserDto> finduser(HashMap<String, String> map);
	int findcnt(HashMap<String, String> map);
	UserDto findnumuser(int num);
	UserDto findprevuser(int num);
	UserDto findnextuser(int num);
	List<UserDto> alluserlistjson();
	int getGradeCnt(int grade);
}
