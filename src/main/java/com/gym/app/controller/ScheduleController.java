package com.gym.app.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.junit.internal.matchers.SubstringMatcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gym.app.dto.ScheduleDto;
import com.gym.app.dto.ScheduleUpdateDto;
import com.gym.app.dto.UserDto;
import com.gym.app.service.ScheduleService;

@Controller
public class ScheduleController {	
	@Autowired private ScheduleService service;
	@RequestMapping(value="/schedule/schedule",method=RequestMethod.GET)
	public String schedule(HttpSession session){
		String id=(String)session.getAttribute("id");
		if(id==null){return ".main";}
		int grade=service.getGrade(id);
		if(grade==1){//관리자로 로그인하면
			return ".schedule.schedule_manager";
		}else if(grade==2){//직원으로 로그인하면
			return ".schedule.ischedule";
		}else{//회원으로 로그인하면
			return ".schedule.schedule_member";
		}
	}
	@RequestMapping(value="/schedule/schedule_trainer",method=RequestMethod.GET)
	public String ischedule(){
		return ".schedule.schedule_trainer";
	}
	@RequestMapping(value="/schedule/list",produces="application/json;charset=utf-8")
	@ResponseBody
	public String getList(Model model,HttpSession session){
		String id=(String)session.getAttribute("id");
		int grade=service.getGrade(id);
		if(grade==3){//회원으로 로그인하면
			List<ScheduleDto> list=service.memberSelect(id);
			JSONArray arr=new JSONArray();
			for(ScheduleDto mm:list){
				JSONObject obj=new JSONObject();
				if(mm.getAttendance()>=1){
					obj.put("title",mm.getIid()+"강사님"+", 출석완료");
					obj.put("start",mm.getStartdate());
					obj.put("end",mm.getEnddate());
					obj.put("color",mm.getColor());
					arr.add(obj);
				}else{
					obj.put("title",mm.getIid()+"강사님"+", 미출석");
					obj.put("start",mm.getStartdate());
					obj.put("end",mm.getEnddate());
					obj.put("color",mm.getColor());
					arr.add(obj);
				}				
			}
			return arr.toString();
		}else{//회원을 제외한 경우
			List<ScheduleDto> list=service.slist();
			JSONArray arr=new JSONArray();
			for(ScheduleDto mm:list){
				JSONObject obj=new JSONObject();
				if(mm.getAttendance()>=1){
					obj.put("title",mm.getIid()+"강사님, " + mm.getId()+"회원님"+", 출석완료");
					obj.put("start",mm.getStartdate());
					obj.put("end",mm.getEnddate());
					obj.put("color",mm.getColor());
					arr.add(obj);
				}else{
					obj.put("title",mm.getIid()+"강사님, " + mm.getId()+"회원님"+", 미출석");
					obj.put("start",mm.getStartdate());
					obj.put("end",mm.getEnddate());
					obj.put("color",mm.getColor());
					arr.add(obj);
				}
			}
			return arr.toString();
		}
	}
	@RequestMapping(value="/schedule/insert",method=RequestMethod.GET)
	@ResponseBody
	public String insert(String memberId,long startDate,long endDate,HttpSession session){	
		String id=memberId;
		String iid=(String)session.getAttribute("id");
		int inum=service.getInstructor(iid);//지금 로그인 해 있는 강사의 고유넘버
		int colorNum=(inum+10)%10;
		String[] arrColor={"#EF8B47","#FF5A5A","#FFB900","#3DFF92","#32A4FF","#464646","#8282FF","#803232","#3ED0C8","#C12DFF"};
		String color=arrColor[colorNum];
		ScheduleDto dto=new ScheduleDto(0,id,iid,startDate,endDate,0,color);
		JSONObject obj=new JSONObject();
		try{
			int n=service.insert(dto);
			if(n>0){
				obj.put("result", "success");
			}else{
				obj.put("result", "fail");
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
			obj.put("result", "fail");
		}
		return obj.toString();
	}
	@RequestMapping(value="/schedule/select",produces="application/json;charset=utf-8")
	@ResponseBody
	public String select(Model model,HttpSession session) throws UnsupportedEncodingException{
		String iid=(String)session.getAttribute("id");
		List<ScheduleDto> list=service.select(iid);
		JSONArray arr=new JSONArray();
		for(ScheduleDto mm:list){
			JSONObject obj=new JSONObject();
			if(mm.getAttendance()>=1){
				obj.put("title","회원 "+mm.getId()+"님, 출석완료");
				obj.put("start",mm.getStartdate());
				obj.put("end",mm.getEnddate());
				obj.put("color",mm.getColor());
				arr.add(obj);
			}else{
				obj.put("title","회원 "+mm.getId()+"님, 미출석");
				obj.put("start",mm.getStartdate());
				obj.put("end",mm.getEnddate());
				obj.put("color",mm.getColor());
				arr.add(obj);
			}
		}
		return arr.toString();
	}
	@RequestMapping(value="/schedule/update",method=RequestMethod.GET)
	@ResponseBody
	public String update(String startTime,String endTime,String formerStart,HttpSession session) throws Exception{	
		String iid=(String)session.getAttribute("id");
		String s1=startTime.substring(0,4);
		String s2=startTime.substring(5,7);
		String s3=startTime.substring(8,10);
		String s4=startTime.substring(11,13);
		String sfull=s1+s2+s3+s4;
		SimpleDateFormat sf=new SimpleDateFormat("yyyyMMddHH");
		Date startday=sf.parse(sfull, new ParsePosition(0));
		long startDate=startday.getTime()+32400000l;
		String e1=endTime.substring(0,4);
		String e2=endTime.substring(5,7);
		String e3=endTime.substring(8,10);
		String e4=endTime.substring(11,13);
		String efull=e1+e2+e3+e4;
		SimpleDateFormat ef=new SimpleDateFormat("yyyyMMddHH");
		Date endday=ef.parse(efull, new ParsePosition(0));
		long endDate=endday.getTime()+32400000l;
		System.out.println(formerStart);
		String f1=formerStart.substring(0,4);
		String f2=formerStart.substring(5,7);
		String f3=formerStart.substring(8,10);
		String f4=formerStart.substring(11,13);
		String ffull=f1+f2+f3+f4;
		System.out.println(ffull);
		SimpleDateFormat ff=new SimpleDateFormat("yyyyMMddHH");
		Date formerday=ff.parse(ffull);
		System.out.println(formerday);
		long formerDate=formerday.getTime()+32400000l;
		System.out.println(startDate+","+endDate+","+iid+","+formerDate);
		ScheduleUpdateDto dto=new ScheduleUpdateDto(startDate,endDate,iid,formerDate);
		JSONObject obj=new JSONObject();
		try{
			int n=service.update(dto);
			if(n>0){
				obj.put("result", "success");
			}else{
				obj.put("result", "fail");
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
			obj.put("result", "fail");
		}
		return obj.toString();
	}
}