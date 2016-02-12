package com.gym.app.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.app.dao.MsgDao;
import com.gym.app.dto.MsgDto;

@Service
public class MsgServiceImpl implements MsgService{
	@Autowired private MsgDao msgDao;

	@Override
	public int insert(MsgDto dto) {
		return msgDao.insert(dto);
	}

	@Override
	public int countMsg(String pid) {
		return msgDao.countMsg(pid);
	}
	
	@Override
	public int delete(int num) {
		return msgDao.delete(num);
	}

	@Override
	public List<MsgDto> list() {
		return msgDao.list();
	}

	@Override
	public List<MsgDto> userlist(String pid) {
		return msgDao.userlist(pid);
	}

	@Override
	public int msgSend(MsgDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int changeRead(String num) {
		return msgDao.changeRead(num);
	}

}
