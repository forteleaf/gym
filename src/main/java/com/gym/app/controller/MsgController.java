package com.gym.app.controller;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gym.app.dto.MsgDto;
import com.gym.app.service.MsgService;
import com.sun.javafx.collections.MappingChange.Map;

@Controller
public class MsgController {
	@Autowired private MsgService service;
	
	@RequestMapping(value="/teamprofile",method=RequestMethod.GET)
	public String teamprofile(){
		return ".user.teamprofile";
	}
	
	@RequestMapping(value="/msg/send",method=RequestMethod.GET)
	public String msgSend(){
		return ".msg.msginsert";
	}
	
	@ResponseBody
	@RequestMapping(value="/msg/send",method=RequestMethod.POST)
	public String msgSend(MsgDto dto){
		int n = service.insert(dto);
		if(n>0){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping(value="/msg/list",method=RequestMethod.GET)
	public ModelAndView msgList(){
		List<MsgDto> mlist = service.list();
		ModelAndView mv = new ModelAndView();
		mv.addObject("mlist",mlist);
		mv.setViewName(".msg.msglist");
		return mv;
	}
	
	@RequestMapping(value="/msg/userlist/{pid}",method=RequestMethod.GET)
	public ModelAndView msgUserList(@PathVariable("pid") String pid){
		List<MsgDto> mlist = service.userlist(pid);
		ModelAndView mv = new ModelAndView();
		mv.addObject("mlist",mlist);
		mv.setViewName("/msg/msglist_window");
		return mv;
	}

/*	// 오리지날 페이지 이동
	@RequestMapping(value="/msg/userlist/{pid}",method=RequestMethod.GET)
	public ModelAndView msgUserList(@PathVariable("pid") String pid){
		List<MsgDto> mlist = service.userlist(pid);
		ModelAndView mv = new ModelAndView();
		mv.addObject("mlist",mlist);
		mv.setViewName(".msg.msglist");
		return mv;
	}
*/	
	// mlist to Json
	
	@ResponseBody
	@RequestMapping(value="/msg/userlistjson/{pid}",method=RequestMethod.GET,produces="text/plain;charset=utf-8")
	public String msgUserListJson(@PathVariable("pid") String pid){
		List<MsgDto> mlist = service.userlist(pid);
		JSONArray arr = new JSONArray();
		for (MsgDto dto : mlist){
			JSONObject jsonDto = new JSONObject();
			jsonDto.put("msgnum", dto.getMsgnum());
			jsonDto.put("id", dto.getId());
			jsonDto.put("content", dto.getContent());
			jsonDto.put("recv_id", dto.getRecv_id());
			jsonDto.put("send_date", dto.getSend_date().toString());
			jsonDto.put("status", dto.getStatus()+"");
			arr.add(jsonDto);
		}
		return arr.toString();
	}

	
	@ResponseBody
	@RequestMapping(value="/msg/countmsg/{pid}",method=RequestMethod.GET)
	public String checkMsg(@PathVariable("pid") String pid){
		int n = service.countMsg(pid);
		//System.out.println("쪽지 갯수 "+n);
		return String.valueOf(n);
	}
	
	@ResponseBody
	@RequestMapping(value="/msg/changeread/{num}",method=RequestMethod.GET)
	public void changeRead(@PathVariable("num") String num){
		service.changeRead(num);
	}

	@ResponseBody
	@RequestMapping("/msg/deletemsg/{num}")
	public void deleteMsg(@PathVariable("num") int num){
		service.delete(num);
	}
}
