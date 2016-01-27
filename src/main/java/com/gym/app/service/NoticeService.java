package com.gym.app.service;

import java.util.HashMap;
import java.util.List;

import com.gym.app.dto.NoticeDto;


public interface NoticeService {
	int insert(NoticeDto dto);
	int delete(int num);
	int update(NoticeDto dto);
	NoticeDto getinfo(int num);
	List<NoticeDto> nlist(HashMap<String, Object> map);
	NoticeDto next(int num);
	NoticeDto prev(int num);
	int addHit(int num);
	int getCount(HashMap<String, Object> map);
	List<NoticeDto> alramNotice();
	String getPic(String id);
}
