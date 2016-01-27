package com.gym.app.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gym.app.dto.UserDto;
import com.gym.app.service.MailService;
import com.gym.app.util.MailSender;

@Controller
public class MailSenderController {
	@Autowired
	private MailService mailService;
	
	// 아이디를 검사
	@ResponseBody
	@RequestMapping(value="/user/findpassword",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	public String SendMailPassword(@RequestParam HashMap<String, Object> map) {
		// @RequestParam 는 필수값이 입력 되어있어야 한다. 값이 없을 때는 exception 을 발생할 수 있다.
		//debug System.out.println(map.get("findId") +"," + map.get("findEmail")+","+map.get("findName"));
		UserDto user = mailService.sendmailcheck(map);
		// 아이디, 이름, 메일이 확인이 되었을 때,
		if (user != null){
			MailSender ms = new MailSender();
			ms.sendMail(user.getId(), user.getPwd(), user.getEmail());
			return "success";
		}else{
			return "fail";
		}
	}

}
