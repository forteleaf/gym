package com.gym.app.service;

import java.util.HashMap;
import java.util.List;

import com.gym.app.dto.QnaDto;

public interface QnaService {
	int insert(QnaDto dto);
	int delete(int num);
	int update(QnaDto dto);
	QnaDto getinfo(int num);
	List<QnaDto> plist(HashMap<String, Object> map);
	QnaDto next(int num);
	QnaDto prev(int num);
	int addHit(int num);
	int getCount(HashMap<String, Object> map);
	List<QnaDto> alramQna();
	String getPic(String id);
	List<QnaDto> jsonlist(int num);
}
