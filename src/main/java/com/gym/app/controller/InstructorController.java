package com.gym.app.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gym.app.dto.InstructorDto;
import com.gym.app.dto.UserDto;
import com.gym.app.service.InstructorService;
import com.gym.app.service.UserService;

@Controller
public class InstructorController {
	@Autowired private InstructorService service;
	@Autowired private UserService service2;
	public void setService(InstructorService service) {
		this.service = service;
	}
	@RequestMapping(value="/instructor/iinsert",method=RequestMethod.GET)
	public String insertForm(){
		return ".instructor.iinsert";
	}
	@RequestMapping(value="/instructor/iinsert",method=RequestMethod.POST)
	public String iinsert(InstructorDto dto){
		try{
			System.out.println(dto.getId());
			int n=service.iinsert(dto);
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("id",dto.getId());
			map.put("grade",2);
			int m=service2.gradeup(map);
			UserDto getnum=service2.idcheck(dto.getId());
			//getnum.getUnum();
			if(n>0 && m>0){
				return "redirect:/user/userinfo?id=" + dto.getId() + "&num=" + getnum.getUnum();
			}else{
				return ".instructor.error";
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".instructor.error";
		}
	}
	@RequestMapping("/instructor/ilist")
	public String ilist(Model model){
		List<InstructorDto> ilist=service.ilist();
		model.addAttribute("ilist", ilist);
		return ".instructor.ilist";
	}
	//강사소개
	@RequestMapping(value="/instructor",method=RequestMethod.GET)
	public String instructor(){
		return ".instructor.instructor";
	}
	//강사퇴사
	@RequestMapping(value="/instructor/deltrain",method=RequestMethod.GET)
	public String deltrain(String id,int num){
		System.out.println("삭제할 id:" + id);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("work", 2);
		map.put("grade", 3);
		int n=service.deltrain(map);
		int m=service2.gradeup(map);
		
		if(n>0 && m>0){
			return "redirect:/user/userinfo?id=" + id + "&num=" + num;
		}else{
			return ".instructor.error";
		}
	}
	//강사복직
	@RequestMapping(value="/instructor/reinsert",method=RequestMethod.POST)
	public String reinsert(InstructorDto dto,int num){
		System.out.println("강사복직번호:" + num);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("id", dto.getId());
		//map.put("sal", dto.getSal());
		map.put("grade", 2);
		int n=service.reinsert(dto);
		int m=service2.gradeup(map);
		
		if(n>0 && m>0){
			return "redirect:/user/userinfo?id=" + dto.getId() + "&num=" + num;
		}else{
			return ".instructor.error";
		}
	}
	//강사정보수정
	@RequestMapping(value="/instructor/update",method=RequestMethod.POST)
	public String update(InstructorDto dto,int num){
		System.out.println("강사수정번호:" + num);
		int n=service.update(dto);
		if(n>0){
			return "redirect:/user/userinfo?id=" + dto.getId() + "&num=" + num;
		}else{
			return ".instructor.error";
		}
	}

	@RequestMapping(value="/instructor/iupdate",method=RequestMethod.GET)
	public String iupdateFoam(int inum,Model model){
		InstructorDto dto=service.idetail(inum);
		model.addAttribute("dto", dto);
		return ".instructor.iupdate";
	}
	@RequestMapping(value="/instructor/iupdate",method=RequestMethod.POST)
	public String iupdate(InstructorDto dto){
		System.out.println(dto.getInfo());
		try{
			int n=service.iupdate(dto);
			if(n>0){
				return ".instructor.success";
			}else{
				return ".instructor.error";
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".instructor.error";
		}
	}
	@RequestMapping(value="/instructor/idelete",method=RequestMethod.GET)
	public String idelete(int inum){
		try{
			int n=service.idelete(inum);
			if(n>0){
				return ".instructor.success";
			}else{
				return ".instructor.error";
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".instructor.error";
		}
	}
	@RequestMapping(value="/instructor/payinfo",method=RequestMethod.GET)
	public String payinfo(Model model){
		List<InstructorDto> ilist=service.ilist();
		
		model.addAttribute("ilist", ilist);
		return ".admin.payinfo";
	}
	//강사 봉급정보
	@RequestMapping(value="/instructor/paydetail" ,produces="application/json;charset=utf-8")
	@ResponseBody
	public String paydetail(){
		List<InstructorDto> ilist=service.ilist();
			
		JSONArray arr=new JSONArray();
		for(InstructorDto payinfo:ilist){
			JSONObject obj=new JSONObject();
			obj.put("inum", payinfo.getInum());
			UserDto name=service2.idcheck(payinfo.getId());
			obj.put("id", payinfo.getId() + ":" + name.getUname());
			obj.put("ijoin", payinfo.getIjoin().toString());
			obj.put("work", payinfo.getWork());
			obj.put("sal", payinfo.getSal());
			arr.add(obj);
		}
		return arr.toString();
		//model.addAttribute("ilist", ilist);
		//return ".admin.payinfo";
	}
	@RequestMapping(value="/instructor/infoupdate" ,method=RequestMethod.POST)
	public String infoupdate(String id, String info,Model model,HttpSession session){
		System.out.println("id:" + id);
		System.out.println("info:" + info);
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("id", id);
		map.put("info", info);
		int n=service.infoupdate(map);
		if(n>0){
			return "redirect:/user/mypage";
		}else{
			return ".user.error";
		}
	}
}
