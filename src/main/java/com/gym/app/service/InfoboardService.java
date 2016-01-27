package com.gym.app.service;

import java.util.HashMap;
import java.util.List;


import com.gym.app.dto.InfoboardDto;


public interface InfoboardService {
	int insert(InfoboardDto dto);
	int delete(int num);
	int update(InfoboardDto dto);
	InfoboardDto getinfo(int num);
	List<InfoboardDto> plist(HashMap<String, Object> map);
	InfoboardDto next(int num);
	InfoboardDto prev(int num);
	int addHit(int num);
	int getCount(HashMap<String, Object> map);
	String getPic(String id);
}
