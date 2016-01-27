package com.gym.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gym.app.dao.ExerDao;
import com.gym.app.dto.ExerDto;

@Service
public class ExerServiceImpl implements ExerService{
	@Autowired private ExerDao exerDao;

	@Transactional
	@Override
	public int insert(ExerDto dto) {
		return exerDao.insert(dto);
	}
	@Override
	public List<ExerDto> allexerlist() {
		return exerDao.allexerlist();
	}
	@Override
	public List<ExerDto> chooseexer(int exclass) {
		return exerDao.chooseexer(exclass);
	}
	@Override
	public ExerDto exerdetail(int exnum) {
		return exerDao.exerdetail(exnum);
	}
	@Override
	public int delete(int exnum) {
		return exerDao.delete(exnum);
	}
	@Override
	public int update(ExerDto dto) {
		return exerDao.update(dto);
	}
	@Override
	public ExerDto getexer(String exname) {
		return exerDao.getexer(exname);
	}
	
	
}
