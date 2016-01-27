package com.gym.app.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.app.dao.AndroidUserDao;
import com.gym.app.dto.AndroidCheckDto;

import com.gym.app.dto.AndroidTrainDto;
import com.gym.app.dto.AndroidUserDto;
import com.gym.app.dto.ScheduleDto;
import com.gym.app.dto.UserDto;

@Service
public class AndroidUserServiceImpl implements AndroidUserService {
	@Autowired
	private AndroidUserDao androidUserDao;

	@Override
	public AndroidUserDto androidLogin(HashMap<String, Object> map) {
		return androidUserDao.androidLogin(map);
		
	}
	@Override
	public AndroidUserDto androidUserGetInfo(String id) {
		return androidUserDao.androidUserGetInfo(id);
	}
	@Override
	public List<AndroidTrainDto> list(String iid) {
		System.out.println("list" + androidUserDao.list(iid));
		return androidUserDao.list(iid);
	}
	@Override
	public int androidCheck(HashMap<String, Object> map) {
		return androidUserDao.androidCheck(map);
	}

}
