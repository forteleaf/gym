package com.gym.app.service;

import java.util.HashMap;
import java.util.List;

import com.gym.app.dto.FboardDto;


public interface FboardService {
	int insert(FboardDto dto);
	int delete(int num);
	int update(FboardDto dto);
	FboardDto getinfo(int num);
	List<FboardDto> plist(HashMap<String, Object> map);
	FboardDto next(int num);
	FboardDto prev(int num);
	int addHit(int num);
	int getCount(HashMap<String, Object> map);
	String getPic(String id);
}
