package com.gym.app.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.jdbc.core.metadata.SybaseCallMetaDataProvider;
import org.springframework.jmx.export.UnableToRegisterMBeanException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gym.app.dao.AndroidUserDao;
import com.gym.app.dto.AndroidCheckDto;

import com.gym.app.dto.AndroidTrainDto;
import com.gym.app.dto.AndroidUserDto;
import com.gym.app.dto.ScheduleDto;
import com.gym.app.service.AndroidUserService;
import com.gym.app.service.ScheduleService;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

@Controller
public class AndroidUserController {
	@Autowired
	private AndroidUserService androidUserService;
	@Autowired 
	private ScheduleService scheduleService;

	@ResponseBody
	@RequestMapping("/user/androidLogin")
	public String androidLogin(HttpServletRequest request, HttpSession session) {

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		AndroidUserDto dto = androidUserService.androidLogin(map);
		JSONObject json = new JSONObject();
		if (dto != null) {
			session.setAttribute("id", dto.getId());
			session.setAttribute("grade", dto.getGrade());
			json.put("grade", dto.getGrade());
			//json.put("result", "success");	
			System.out.println("json들어 있는 값" + json);
		} else {
			request.setAttribute("err", "존재하지 않습니다");
			json.put("grade", 0);
			System.out.println("json들어 있는 값" + json);
		}
		return json.toString();
	}
	@ResponseBody
	@RequestMapping(value="/user/androidUserGetInfo/{id}",produces="application/json;charset=utf-8")
	public String androidUserGetInfo(@PathVariable("id")String id) throws UnsupportedEncodingException {
	AndroidUserDto dto=androidUserService.androidUserGetInfo(id);
	
	JSONObject arr=new JSONObject();
	if(dto !=null){
		arr.put("unum", dto.getUnum());
		arr.put("sex", dto.getSex());
		arr.put("uname", dto.getUname());
		arr.put("phone", dto.getPhone());
		arr.put("addr",dto.getAddr());
		arr.put("grade", dto.getGrade());
		arr.put("savefile", dto.getSavefile());
		System.out.println("json들어 있는 값" + arr);
	}else{
		arr.put("err", "아이디가 존재하지 않습니다");
		System.out.println("json들어 있는 값" + arr);
	}
	return arr.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/user/androidUserList/{iid}",produces = "application/json;charset=utf-8")
	public String list(@PathVariable("iid")String iid)throws UnsupportedEncodingException{				
		List<AndroidTrainDto> list =androidUserService.list(iid);
		System.out.println(list.toString());
		
		JSONArray arr = new JSONArray();
		for(AndroidTrainDto dto:list){
			JSONObject js = new JSONObject();
			js.put("iid", dto.getIid());
			js.put("uname", dto.getUname());
			js.put("phone", dto.getPhone());
			js.put("att", dto.getAttendance());
			js.put("savefile", dto.getSavefile());
			js.put("stdate", dto.getStartdate());
			arr.add(js);
		}
		System.out.println("arr :" + arr);
		return arr.toString();
		

		
	}
	@ResponseBody
	@RequestMapping("/user/androidCheck")
	public String androidCheck(AndroidCheckDto dto,HttpServletRequest request,@RequestParam long startdate){
		int n = 0;
		
		String id = request.getParameter("id");
		System.out.println("spring startdate"+startdate); 	
		List<ScheduleDto> list = scheduleService.memberSelect(id);
		System.out.println(list);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		for(ScheduleDto dto1 : list){
			// 스케쥴시작 < now < 스케쥴끝
			System.out.println("startdate" + startdate);
			System.out.println(dto1.getStartdate() +", "+ dto1.getEnddate());
			if(startdate <= dto1.getStartdate() && startdate <= dto1.getEnddate()){
				System.out.println("조건이 만족되요!");
				
				n=1;
				map.put("startdate", dto1.getStartdate());
				androidUserService.androidCheck(map);
			}else{
				System.out.println("조건이 만족안되요!");
			}
		}
			
		JSONObject json = new JSONObject();
		if(n>0){
			// 출석 DB update
			json.put("result", "success");
			System.out.println("success");
		}else{
			json.put("result", "fail");
			System.out.println("fail");
		}
		System.out.println("json" + json);
		return json.toString();		
		
	}
}
	

