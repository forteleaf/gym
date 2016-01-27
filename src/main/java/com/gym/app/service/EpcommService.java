package com.gym.app.service;


import java.util.HashMap;
import java.util.List;

import com.gym.app.dto.EpcommDto;




public interface EpcommService {
	int insert(EpcommDto dto);
	List<EpcommDto> list(HashMap<String, Integer> map);
	int getCount(int epnum);
	int delete(int ecnum);
	int update(EpcommDto dto);
	String getPic(String id);
}
