package com.gym.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gym.app.dao.FboardDao;
import com.gym.app.dto.FboardDto;



@Service
public class FboardServiceImpl implements FboardService{
	@Autowired private FboardDao fbdao;
	@Transactional
	@Override
	public int insert(FboardDto dto) {	
		return fbdao.insert(dto);
	}
	@Override
	public int delete(int fbnum){
		return fbdao.delete(fbnum);
	}
	@Override
	public int update(FboardDto dto) {
		return fbdao.update(dto);
	}
	@Override
	public FboardDto getinfo(int fbnum) {
		return fbdao.getInfo(fbnum);
	}
	@Override
	public List<FboardDto> plist(HashMap<String, Object> map) {		
		return fbdao.plist(map);
	}
	@Override
	public FboardDto next(int fbnum){
		return fbdao.next(fbnum);
	}
	@Override
	public FboardDto prev(int fbnum){
		return fbdao.prev(fbnum);
	}
	@Override
	public int addHit(int fbnum){
		return fbdao.addHit(fbnum);
	}
	public int getCount(HashMap<String, Object> map1){
		return fbdao.getCount(map1);
	}
	@Override
	public String getPic(String id) {
		
		return fbdao.getPic(id);
	}
	
}
