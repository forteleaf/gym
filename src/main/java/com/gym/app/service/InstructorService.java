package com.gym.app.service;

import java.util.HashMap;
import java.util.List;

import com.gym.app.dto.InstructorDto;

public interface InstructorService{
	int iinsert(InstructorDto dto);
	List<InstructorDto> ilist();
	InstructorDto seltrain(String id);
	int deltrain(HashMap<String, Object> map);
	int reinsert(InstructorDto dto);
	int update(InstructorDto dto);
	int idelete(int inum);
	int iupdate(InstructorDto dto);
	InstructorDto idetail(int inum);
	int infoupdate(HashMap<String, String> map);
}
