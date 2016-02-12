package com.gym.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.app.dao.FbcommDao;
import com.gym.app.dto.FbcommDto;

@Service
public class FbcommServiceImpl implements FbcommService {
	@Autowired private FbcommDao fbcommdao;
	@Override
	public int insert(FbcommDto dto) {
		return fbcommdao.insert(dto);
	}

	@Override
	public List<FbcommDto> list(HashMap<String, Integer> map) {	
		return fbcommdao.list(map);
	}
	public int getCount(int fbnum){
		return fbcommdao.getCount(fbnum);
	}
	@Override
	public int delete(int fcnum) {
		return fbcommdao.delete(fcnum);
	}
	@Override
	public int update(FbcommDto dto) {
		return fbcommdao.update(dto);
	}

	@Override
	public String getPic(String id) {
		
		return fbcommdao.getPic(id);
	}
	
}
