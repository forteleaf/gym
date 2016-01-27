package com.gym.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.app.dao.EpcommDao;
import com.gym.app.dto.EpcommDto;



@Service
public class EpcommServiceImpl implements EpcommService {
	@Autowired private EpcommDao epcommdao;
	@Override
	public int insert(EpcommDto dto) {
		return epcommdao.insert(dto);
	}

	@Override
	public List<EpcommDto> list(HashMap<String, Integer> map) {	
		return epcommdao.list(map);
	}
	public int getCount(int epnum){
		return epcommdao.getCount(epnum);
	}
	@Override
	public int delete(int ecnum) {
		return epcommdao.delete(ecnum);
	}
	@Override
	public int update(EpcommDto dto) {
		return epcommdao.update(dto);
	}

	@Override
	public String getPic(String id) {
		
		return epcommdao.getPic(id);
	}
	
}
