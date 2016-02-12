package com.gym.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.app.dao.IfcommDao;
import com.gym.app.dto.IfcommDto;


@Service
public class IfcommServiceImpl implements IfcommService {
	@Autowired private IfcommDao icdao;
	@Override
	public int insert(IfcommDto dto) {
		return icdao.insert(dto);
	}
	@Override
	public List<IfcommDto> list(HashMap<String, Integer> map) {	
		return icdao.list(map);
	}
	public int getCount(int ifnum){
		return icdao.getCount(ifnum);
	}
	@Override
	public int delete(int icnum) {
		return icdao.delete(icnum);
	}
	@Override
	public int update(IfcommDto dto) {
		return icdao.update(dto);
	}
	@Override
	public String getPic(String id) {
		
		return icdao.getPic(id);
	}
	
}
