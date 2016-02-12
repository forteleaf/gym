package com.gym.app.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gym.app.dto.LockerDto;
import com.gym.app.service.LockerService;

@Controller
public class LockerController {
	@Autowired private LockerService service;
	@RequestMapping(value="/locker/linsert",method=RequestMethod.GET)
	@ResponseBody
	public String linsert(int lnum, String id,int sex,int rent,String rentstart,String rentend){
		try{
			LockerDto dto=new LockerDto(lnum, id, sex, rent, rentstart, rentend);
			int n=service.linsert(dto);
			StringBuffer sb=new StringBuffer();
			sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			sb.append("<insert>");
			if(n>0){
				sb.append("<info>success</info>");
			}else{
				sb.append("<info>error</info>");
			}
			sb.append("</insert>");
			return sb.toString();
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".locker.error";
		}
	}
	@RequestMapping("/locker/llist")
	@ResponseBody
	public String llist(){
		List<LockerDto> llist=service.llist();
		try{
			StringBuffer sb=new StringBuffer();
			sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			sb.append("<lists>");
			for(LockerDto dto:llist){
				sb.append("<list>");
				sb.append("<lnum>" + dto.getLnum() + "</lnum>");
				sb.append("<id>" + dto.getId() + "</id>");
				sb.append("<rent>" + dto.getRent() + "</rent>");
				sb.append("<rentstart>" + dto.getRentstart() + "</rentstart>");
				sb.append("<rentend>" + dto.getRentend() + "</rentend>");
				sb.append("</list>");
			}
			sb.append("</lists>");
			return sb.toString();
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".locker.error";
		}
	}
	@RequestMapping(value="/locker/ldelete",method=RequestMethod.GET)
	@ResponseBody
	public String ldelete(int lnum){
		try{
			int n=service.ldelete(lnum);
			StringBuffer sb=new StringBuffer();
			sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			sb.append("<delete>");
			if(n>0){
				sb.append("<info>success</info>");
			}else{
				sb.append("<info>error</info>");
			}
			sb.append("</delete>");
			return sb.toString();
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".locker.error";
		}
	}
	/*@RequestMapping(value="/locker/lupdate",method=RequestMethod.GET)
	public String lupdateFoam(int lnum,Model model){
		LockerDto dto=service.ldetail(lnum);
		
		model.addAttribute("dto", dto);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<update>");
		
		sb.append("</update>");
		return "";
	}*/
	@RequestMapping(value="/locker/lupdate",method=RequestMethod.GET)
	@ResponseBody
	public String lupdate(int lnum, String id,int sex,int rent,String rentstart,String rentend){
			LockerDto dto=new LockerDto(lnum, id, sex, rent, rentstart, rentend);
		try{
			int n=service.lupdate(dto);
			StringBuffer sb=new StringBuffer();
			sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			sb.append("<update>");
			if(n>0){
				sb.append("<info>success</info>");
			}else{
				sb.append("<info>error</info>");
			}
			sb.append("</update>");
			return sb.toString();
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".locker.error";
		}
	}
	@RequestMapping(value="/locker/locget",method=RequestMethod.GET)
	@ResponseBody
	public String locget(int lnum,Model model){
		LockerDto dto=service.ldetail(lnum);
		StringBuffer sb=new StringBuffer();
		if(dto==null){
			sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			sb.append("<locker>");
			sb.append("<lnum>" + lnum +"</lnum>");
			sb.append("<id>" + "" +"</id>");
			sb.append("<sex>" + "" +"</sex>");
			sb.append("<rent>" + "" +"</rent>");
			sb.append("<rentstart>" + "" +"</rentstart>");
			sb.append("<rentend>" + "" +"</rentend>");
			sb.append("</locker>");
			return sb.toString();
		}else{
			sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			sb.append("<locker>");
			sb.append("<lnum>" + dto.getLnum() +"</lnum>");
			sb.append("<id>" + dto.getId() +"</id>");
			sb.append("<sex>" + dto.getSex() +"</sex>");
			sb.append("<rent>" + dto.getRent() +"</rent>");
			sb.append("<rentstart>" + dto.getRentstart() +"</rentstart>");
			sb.append("<rentend>" + dto.getRentend() +"</rentend>");
			sb.append("</locker>");
			return sb.toString();
		}
	}
	@RequestMapping(value="/locker/situation",method=RequestMethod.GET)
	public String situation(){
		return ".locker.locker";
	}
	@RequestMapping(value="/locker/main",method=RequestMethod.GET)
	public String locker(){
		return ".locker.lockermain";
	}
}