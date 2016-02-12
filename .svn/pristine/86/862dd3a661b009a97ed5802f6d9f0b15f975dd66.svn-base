package com.gym.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.app.dao.LockerDao;
import com.gym.app.dto.LockerDto;

@Service
public class LockerServiceImpl implements LockerService{
	@Autowired private LockerDao lockerDao;
	@Override
	public int linsert(LockerDto dto) {
		return lockerDao.linsert(dto);
	}
	@Override
	public List<LockerDto> llist() {
		return lockerDao.llist();
	}
	@Override
	public int ldelete(int lnum) {
		return lockerDao.ldelete(lnum);
	}
	@Override
	public int lupdate(LockerDto dto) {
		return lockerDao.lupdate(dto);
	}
	public LockerDto ldetail(int lnum) {
		return lockerDao.ldetail(lnum);
	}
}
