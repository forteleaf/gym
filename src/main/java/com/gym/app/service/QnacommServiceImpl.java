package com.gym.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.app.dao.QnacommDao;
import com.gym.app.dto.QnacommDto;
@Service
public class QnacommServiceImpl implements QnacommService {
	@Autowired private QnacommDao qnacommdao;
	@Override
	public int insert(QnacommDto dto) {
		return qnacommdao.insert(dto);
	}

	@Override
	public List<QnacommDto> list(HashMap<String, Integer> map) {	
		return qnacommdao.list(map);
	}
	public int getCount(int qnanum){
		return qnacommdao.getCount(qnanum);
	}
	@Override
	public int delete(int qcnum) {
		return qnacommdao.delete(qcnum);
	}
	@Override
	public int update(QnacommDto dto) {
		return qnacommdao.update(dto);
	}

	@Override
	public String getPic(String id) {
		return qnacommdao.getPic(id);
	}
	
}
