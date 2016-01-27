package com.gym.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gym.app.dto.InsUserDto;
import com.gym.app.service.InsUserService;

@Controller
public class InsUserController {
	@Autowired private InsUserService service;
	@RequestMapping(value="/insuser",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String detail() {
		List<InsUserDto> list=service.getinfo();
		try{
			StringBuffer sb=new StringBuffer();
			sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			sb.append("<insusers>");
			for(InsUserDto dto:list){
				sb.append("<insuser>");
				sb.append("<unum>" + dto.getUnum() + "</unum>");
				sb.append("<uname>"+ dto.getUname() + "</uname>");
				sb.append("<id>"+ dto.getId() + "</id>");
				sb.append("<email>"+ dto.getEmail() + "</email>");
				sb.append("<sex>"+ dto.getSex() + "</sex>");
				sb.append("<addr>"+ dto.getAddr() + "</addr>");
				sb.append("<phone>"+ dto.getPhone() + "</phone>");
				sb.append("<work>"+ dto.getWork() + "</work>");
				sb.append("<grade>"+ dto.getGrade() + "</grade>");
				sb.append("<savefile>"+ dto.getSavefile() + "</savefile>");
				sb.append("<info>"+ dto.getInfo() + "</info>");
				sb.append("</insuser>");
			}
			sb.append("</insusers>");
			return sb.toString();
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".instructor.instructor";
		}
	}
}
