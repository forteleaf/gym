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
		// ���� ȸ���� ���� �ִ� ȸ��
		List<String> list = ScheduleService.getBestInstructor();
		System.out.println(list);
		
		String name = list.get(0);
		UserDto dto=userService.idcheck(name);
		JSONObject json = new JSONObject();
		json.put("name", dto.getUname());
		json.put("savefile", dto.getSavefile());
		
		return json.toJSONString(); 
	}
	
	// ȸ�� �� ����
	@ResponseBody
	@RequestMapping(value="/analysize/mathSales",produces="application/json;charset=utf-8")
	public String mathSales(){
		// Ʈ���̳� ��ü �޿� �޾ƿ���
		int trainerSal=0;
		List<InstructorDto> train=trainService.ilist();
		for(InstructorDto tt:train){
			if(tt.getWork()==1){
				trainerSal+=tt.getSal();
			}

		}
		//Ʈ���̳� �ο���
		int cntTrainer = userService.getGradeCnt(2);
		//ȸ�� �ο���
		int cntUsers = userService.getGradeCnt(3);
		//ȸ���� ȸ�� ����
		int usersprice = cntUsers*100000;
		// ȸ���� �޾ƿ���
		JSONObject json = new JSONObject();
		json.put("trainerSal", trainerSal);
		json.put("cntTrainer", cntTrainer);
		json.put("cntUsers", cntUsers);
		json.put("usersprice", usersprice);
				
		return json.toJSONString();
	}
	
	// �м� ���̺�� �̵�
	@RequestMapping(value="/analysis",produces="application/json;charset=utf-8")
	public String jsonplist(Model model){	
		// �ֱ� 6�� ���� ����
		List<QnaDto> list=qnaService.jsonlist(10);
		model.addAttribute("qnalist",list);
		return ".analysis.analysis";
	}
	
}
