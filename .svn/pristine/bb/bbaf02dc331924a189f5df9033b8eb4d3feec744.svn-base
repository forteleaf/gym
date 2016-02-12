package com.gym.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gym.app.dao.ScheduleDao;
import com.gym.app.dto.ScheduleDto;
import com.gym.app.dto.ScheduleUpdateDto;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired private ScheduleDao scheduledao;
	@Transactional
	@Override
	public List<ScheduleDto> slist(){
		return scheduledao.slist();
	}
	@Override
	public int insert(ScheduleDto dto) {
		return scheduledao.insert(dto);
	}
	@Override
	public List<ScheduleDto> select(String iid) {
		return scheduledao.select(iid);
	}
	@Override
	public List<ScheduleDto> memberSelect(String id) {
		return scheduledao.memberSelect(id);
	}
	@Override
	public int getGrade(String id) {
		return scheduledao.getGrade(id);
	}
	@Override
	public int getInstructor(String id) {
		return scheduledao.getInstructor(id);
	}
	@Override
	public int update(ScheduleUpdateDto dto) {
		return scheduledao.update(dto);
	}
	@Override
	public List<String> getBestInstructor() {
		return scheduledao.getBestInstructor();
	}
}
