package com.gym.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.app.dao.InsUserDao;
import com.gym.app.dto.InsUserDto;

@Service
public class InsUserServiceImpl implements InsUserService{
	@Autowired private InsUserDao insuserDao;
	@Override
	public List<InsUserDto> getinfo() {
		return insuserDao.getinfo();
	}
}
