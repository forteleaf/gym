package com.gym.app.controller;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gym.app.dto.InstructorDto;
import com.gym.app.dto.QnaDto;
import com.gym.app.dto.UserDto;
import com.gym.app.service.InstructorService;
import com.gym.app.service.QnaService;
import com.gym.app.service.ScheduleService;
import com.gym.app.service.UserService;

@Controller
public class AnalysisController {
	@Autowired ScheduleService ScheduleService;
	@Autowired UserService userService;
	@Autowired InstructorService trainService;
	@Autowired QnaService qnaService;
	
	@ResponseBody
	@RequestMapping(value="/analysize/getBestInstructor",produces="application/json;charset=utf-8")
	public String GetBestInstructor(){
		// 많은 회원을 갖고 있는 회원
		List<String> list = ScheduleService.getBestInstructor();
		System.out.println(list);
		
		String name = list.get(0);
		UserDto dto=userService.idcheck(name);
		JSONObject json = new JSONObject();
		json.put("name", dto.getUname());
		json.put("savefile", dto.getSavefile());
		
		return json.toJSONString(); 
	}
	
	// 회계 돈 관련
	@ResponseBody
	@RequestMapping(value="/analysize/mathSales",produces="application/json;charset=utf-8")
	public String mathSales(){
		// 트레이너 전체 급여 받아오기
		int trainerSal=0;
		List<InstructorDto> train=trainService.ilist();
		for(InstructorDto tt:train){
			if(tt.getWork()==1){
				trainerSal+=tt.getSal();
			}

		}
		//트레이너 인원수
		int cntTrainer = userService.getGradeCnt(2);
		//회원 인원수
		int cntUsers = userService.getGradeCnt(3);
		//회원들 회비 총합
		int usersprice = cntUsers*100000;
		// 회원수 받아오기
		JSONObject json = new JSONObject();
		json.put("trainerSal", trainerSal);
		json.put("cntTrainer", cntTrainer);
		json.put("cntUsers", cntUsers);
		json.put("usersprice", usersprice);
				
		return json.toJSONString();
	}
	
	// 분석 테이블로 이동
	@RequestMapping(value="/analysis",produces="application/json;charset=utf-8")
	public String jsonplist(Model model){	
		// 최근 6개 문의 보기
		List<QnaDto> list=qnaService.jsonlist(10);
		model.addAttribute("qnalist",list);
		return ".analysis.analysis";
	}
	
}
