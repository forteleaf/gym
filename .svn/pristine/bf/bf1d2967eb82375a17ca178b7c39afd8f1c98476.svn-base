package com.gym.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gym.app.dao.QnaDao;
import com.gym.app.dto.QnaDto;


@Service
public class QnaServiceImpl implements QnaService{
	@Autowired private QnaDao qnadao;
	@Transactional
	@Override
	public int insert(QnaDto dto) {	
		return qnadao.insert(dto);
	}
	@Override
	public int delete(int qnanum){
		return qnadao.delete(qnanum);
	}
	@Override
	public int update(QnaDto dto) {
		return qnadao.update(dto);
	}
	@Override
	public QnaDto getinfo(int qnanum) {
		return qnadao.getInfo(qnanum);
	}
	@Override
	public List<QnaDto> plist(HashMap<String, Object> map) {		
		return qnadao.plist(map);
	}
	@Override
	public QnaDto next(int qnanum){
		return qnadao.next(qnanum);
	}
	@Override
	public QnaDto prev(int qnanum){
		return qnadao.prev(qnanum);
	}
	@Override
	public int addHit(int qnanum){
		return qnadao.addHit(qnanum);
	}
	public int getCount(HashMap<String, Object> map1){
		return qnadao.getCount(map1);
	}
	
	@Override
	public List<QnaDto> alramQna() {
		return qnadao.alramQna();
	}
	@Override
	public String getPic(String id) {
		return qnadao.getPic(id);
	}
	// 최신 글 ${num} 갯수 받아오기
	@Override
	public List<QnaDto> jsonlist(int num) {
		return qnadao.jsonlist(num);
	}
	

}
