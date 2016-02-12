package com.gym.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gym.app.dao.NoticeDao;
import com.gym.app.dto.NoticeDto;
@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired private NoticeDao ntdao;
	@Transactional
	@Override
	public int insert(NoticeDto dto) {
		return ntdao.insert(dto);
	}

	@Override
	public int delete(int ntnum) {
		return ntdao.delete(ntnum);
	}

	@Override
	public int update(NoticeDto dto) {
		return ntdao.update(dto);
	}

	@Override
	public NoticeDto getinfo(int ntnum) {
		return ntdao.getInfo(ntnum);
	}

	@Override
	public List<NoticeDto> nlist(HashMap<String, Object> map) {
		return ntdao.nlist(map);
	}

	@Override
	public NoticeDto next(int ntnum) {	
		return ntdao.next(ntnum);
	}

	@Override
	public NoticeDto prev(int ntnum) {
		return ntdao.prev(ntnum);
	}

	@Override
	public int addHit(int ntnum) {
		return ntdao.addHit(ntnum);
	}

	@Override
	public int getCount(HashMap<String, Object> map1) {
		return ntdao.getCount(map1);
	}
	
	@Override
	public List<NoticeDto> alramNotice() {
		return ntdao.alramNotice();
	}

	@Override
	public String getPic(String id) {
		
		return ntdao.getPic(id);
	}
	
}
