package com.gym.app.controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gym.app.dto.ExerDto;
import com.gym.app.service.ExerService;
import com.gym.app.util.PageUtil;

@Controller
public class ExerController {
	@Autowired private ExerService service;
	//회원가입 페이지로
	@RequestMapping(value="/exer/allexerlist",method=RequestMethod.GET)
	public String allexerlist(
			@RequestParam(value="pageNum",defaultValue="1")int pageNum, Model model){
		
		//PageUtil pu=new PageUtil(pageNum, rowCount, 10, 10);
		
		List<ExerDto> list=service.allexerlist();
		List<ExerDto> ex1=service.chooseexer(1);
		List<ExerDto> ex2=service.chooseexer(2);
		List<ExerDto> ex3=service.chooseexer(3);
		List<ExerDto> ex4=service.chooseexer(4);
		List<ExerDto> ex5=service.chooseexer(5);
		model.addAttribute("ex1",ex1);
		model.addAttribute("ex2",ex2);
		model.addAttribute("ex3",ex3);
		model.addAttribute("ex4",ex4);
		model.addAttribute("ex5",ex5);
		model.addAttribute("list",list);
		return ".exer.exerlist";
	}
	
	@ResponseBody
	@RequestMapping(value="/exer/exerdetail/{exnum}",produces="application/json;charset=utf-8")
	public String exerdetail(@PathVariable("exnum")int exnum, Model model){
		ExerDto dto=service.exerdetail(exnum);
		JSONObject arr=new JSONObject();
		arr.put("exnum", dto.getExnum());
		arr.put("exname", dto.getExname());
		arr.put("exclass", dto.getExclass());
		arr.put("calo",dto.getCalorie());
		arr.put("aero", dto.getAero());
		arr.put("stren", dto.getStrength());
		arr.put("sta", dto.getStamina());
		arr.put("info", dto.getExerinfo());
		return arr.toString();
	}
	@RequestMapping("/exer/delete")
	public String delete(int exnum){
		service.delete(exnum);
		return "redirect:/exer/allexerlist";
	}
	@RequestMapping(value="/exer/insert" ,method=RequestMethod.POST)
	public String insert(ExerDto dto){
		System.out.println("넘어옴 추가");
		int n=service.insert(dto); 
		if(n>0){
			return "redirect:/exer/allexerlist";
		}else{
			System.out.println("What????");
			return ".user.error";
		}
	}
	@RequestMapping(value="/exer/update" ,method=RequestMethod.POST)
	public String update(ExerDto dto){
		System.out.println("넘어옴 수정");
		int n=service.update(dto); 
		if(n>0){
			return "redirect:/exer/allexerlist";
		}else{
			System.out.println("What????");
			return ".user.error";
		}
	}
	@RequestMapping(value="/exer/exclass/{exclass}" ,produces="application/json;charset=utf-8")
	@ResponseBody
	public String exclass(@PathVariable("exclass")int exclass){
		List<ExerDto> exlist=service.chooseexer(exclass);
		JSONArray arr=new JSONArray();
		for(ExerDto dto:exlist){
			JSONObject obj=new JSONObject();
			obj.put("exnum", dto.getExnum());
			obj.put("exname", dto.getExname());
			obj.put("exclass", dto.getExclass());
			obj.put("calo",dto.getCalorie());
			obj.put("aero", dto.getAero());
			obj.put("stren", dto.getStrength());
			obj.put("sta", dto.getStamina());
			obj.put("info", dto.getExerinfo());
			arr.add(obj);
		}
		return arr.toString();
	}
	@RequestMapping(value="/exer/getexer/{exername}" ,produces="application/json;charset=utf-8")
	@ResponseBody
	public String getexer(@PathVariable("exername")String exername){
		ExerDto dto=service.getexer(exername);
		JSONObject obj=new JSONObject();
		obj.put("exnum", dto.getExnum());
		obj.put("exname", dto.getExname());
		obj.put("exclass", dto.getExclass());
		obj.put("calo",dto.getCalorie());
		obj.put("aero", dto.getAero());
		obj.put("stren", dto.getStrength());
		obj.put("sta", dto.getStamina());
		obj.put("info", dto.getExerinfo());
		return obj.toString();
	}
	
	
	
}