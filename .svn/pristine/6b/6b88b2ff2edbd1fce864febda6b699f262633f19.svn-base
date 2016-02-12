package com.gym.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gym.app.dao.DiaryDao;
import com.gym.app.dao.ExerDao;
import com.gym.app.dto.DiaryDto;

@Service
public class DiaryServiceImpl implements DiaryService{
	@Autowired private DiaryDao diaryDao;

	@Transactional
	@Override
	public int insert(DiaryDto dto) {
		return diaryDao.insert(dto);
	}

	@Override
	public List<DiaryDto> select() {
		return diaryDao.select();
	}

	@Override
	public List<DiaryDto> selectid(String id) {
		return diaryDao.selectid(id);
	}

	@Override
	public int delete(int d_num) {
		return diaryDao.delete(d_num);
	}

	@Override
	public int update(DiaryDto dto) {
		return diaryDao.update(dto);
	}

	@Override
	public DiaryDto check(long start) {
		return diaryDao.check(start);
	}

	@Override
	public List<DiaryDto> count(String id) {
		return diaryDao.count(id);
	}
	
	
	
}
