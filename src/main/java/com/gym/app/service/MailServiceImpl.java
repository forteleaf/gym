package com.gym.app.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.app.dao.MailSenderDao;
import com.gym.app.dto.UserDto;


@Service
public class MailServiceImpl implements MailService {
	@Autowired private MailSenderDao mailSenderDao;

	@Override
	public UserDto sendmailcheck(HashMap<String, Object> map) {
		return mailSenderDao.sendmailcheck(map);
	}

}
