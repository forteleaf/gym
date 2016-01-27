package com.gym.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.app.dao.InstructorDao;
import com.gym.app.dto.InstructorDto;

@Service
public class InstructorServiceImpl implements InstructorService{
	@Autowired private InstructorDao instructordao;
	@Override
	public int iinsert(InstructorDto dto) {
		return instructordao.iinsert(dto);
	}
	@Override
	public List<InstructorDto> ilist() {
		return instructordao.ilist();
	}
	@Override
	public InstructorDto seltrain(String id) {
		return instructordao.seltrain(id);
	}
	@Override
	public int deltrain(HashMap<String, Object> map) {
		return instructordao.deltrain(map);
	}
	@Override
	public int reinsert(InstructorDto dto) {
		return instructordao.reinsert(dto);
	}
	@Override
	public int update(InstructorDto dto) {
		return instructordao.update(dto);
	}
	@Override
	public int iupdate(InstructorDto dto) {
		return instructordao.iupdate(dto);
	}
	@Override
	public int idelete(int inum) {
		return instructordao.idelete(inum);
	}
	@Override
	public InstructorDto idetail(int inum) {
		return instructordao.idetail(inum);
	}
	@Override
	public int infoupdate(HashMap<String, String> map) {
		return instructordao.infoupdate(map);
	}
	
}	
