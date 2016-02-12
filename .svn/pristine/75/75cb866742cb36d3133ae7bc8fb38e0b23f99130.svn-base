package com.gym.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gym.app.dao.EpboardDao;
import com.gym.app.dto.EpboardDto;




@Service
public class EpboardServiceImpl implements EpboardService{
	@Autowired private EpboardDao epdao;
	@Transactional
	@Override
	public int insert(EpboardDto dto) {	
		return epdao.insert(dto);
	}
	@Override
	public int delete(int epnum){
		return epdao.delete(epnum);
	}
	@Override
	public int update(EpboardDto dto) {
		return epdao.update(dto);
	}
	@Override
	public EpboardDto getinfo(int epnum) {
		return epdao.getInfo(epnum);
	}
	@Override
	public List<EpboardDto> plist(HashMap<String, Object> map) {		
		return epdao.plist(map);
	}
	@Override
	public EpboardDto next(int epnum){
		return epdao.next(epnum);
	}
	@Override
	public EpboardDto prev(int epnum){
		return epdao.prev(epnum);
	}
	@Override
	public int addHit(int epnum){
		return epdao.addHit(epnum);
	}
	public int getCount(HashMap<String, Object> map1){
		return epdao.getCount(map1);
	}
	@Override
	public String getPic(String id) {
		
		return epdao.getPic(id);
	}
	
}
