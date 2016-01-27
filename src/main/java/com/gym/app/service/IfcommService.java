package com.gym.app.service;


import java.util.HashMap;
import java.util.List;

import com.gym.app.dto.IfcommDto;



public interface IfcommService {
	int insert(IfcommDto dto);
	List<IfcommDto> list(HashMap<String, Integer> map);
	int getCount(int ifnum);
	int delete(int icnum);
	int update(IfcommDto dto);
	String getPic(String id);
}
