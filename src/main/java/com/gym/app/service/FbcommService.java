package com.gym.app.service;


import java.util.HashMap;
import java.util.List;

import com.gym.app.dto.FbcommDto;



public interface FbcommService {
	int insert(FbcommDto dto);
	List<FbcommDto> list(HashMap<String, Integer> map);
	int getCount(int fbnum);
	int delete(int fcnum);
	int update(FbcommDto dto);
	String getPic(String id);
}
