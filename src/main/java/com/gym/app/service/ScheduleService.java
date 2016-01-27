package com.gym.app.service;

import java.util.List;

import com.gym.app.dto.ScheduleDto;
import com.gym.app.dto.ScheduleUpdateDto;

public interface ScheduleService {
	List<ScheduleDto> slist();
	int insert(ScheduleDto dto);
	List<ScheduleDto> select(String iid);
	List<ScheduleDto> memberSelect(String id);
	int getGrade(String id);
	int getInstructor(String id);
	int update(ScheduleUpdateDto dto);
	List<String> getBestInstructor();
}
