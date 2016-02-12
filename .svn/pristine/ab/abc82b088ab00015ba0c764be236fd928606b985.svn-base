package com.gym.app.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gym.app.dto.IfcommDto;
import com.gym.app.service.IfcommService;
import com.gym.app.util.PageUtil;


@Controller
public class IfcommController {
	@Autowired private IfcommService service;
	@RequestMapping(value="/infoboard/detail/icinsert",method=RequestMethod.GET)
	@ResponseBody
	public String insert(int icnum,int ifnum,String id,String comments,int icref,int iclev,int icstep){
		IfcommDto dto=new IfcommDto(icnum, ifnum, id, comments,icref,iclev,icstep,null);
		int n=service.insert(dto);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<result>");
		if(n>0){
			sb.append("<info>success</info>");
		}else{
			sb.append("<info>fail</info>");
		}
		sb.append("</result>");
		return sb.toString();
	}
	@RequestMapping("/infoboard/detail/iclist")
	@ResponseBody
	public String list(@RequestParam(value="pageNum",defaultValue="1")int pageNum,int ifnum,String sid,Model model) throws Exception{
		int rowCount=service.getCount(ifnum);
		System.out.println("pageNum:"+pageNum);
		PageUtil pu=new PageUtil(pageNum, rowCount,10, 10);
		HashMap<String , Integer> map=new HashMap<String, Integer>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		map.put("ifnum", ifnum);
		List<IfcommDto> list=service.list(map);
		
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<comm>");
		for(IfcommDto dto:list){
			sb.append("<comment>");
			sb.append("<icnum>" + dto.getIcnum() +"</icnum>");
			sb.append("<id>" + dto.getId() +"</id>");
			String savefile=service.getPic(dto.getId());	
			String savefile1=service.getPic(sid);
			sb.append("<savefile>"+savefile+"</savefile>");
			sb.append("<savefile1>"+savefile1+"</savefile1>");
			if(dto.getComments()!=null){
				String comments=URLEncoder.encode(dto.getComments(),"utf-8");
				comments=comments.replaceAll("\\+","%20");//공백이 있는경우 +바뀐것을 다시 공백으로 바꾸기
				sb.append("<comments>" + comments +"</comments>");
			}else{
				sb.append("<comments>" + dto.getComments() +"</comments>");
			}
			sb.append("<startPage>"+pu.getStartPage()+ "</startPage>");
			sb.append("<endPage>"+pu.getEndPage()+ "</endPage>");
			sb.append("<pageNum>"+pu.getPageNum()+ "</pageNum>");
			sb.append("<pageCount>"+pu.getPageCount()+ "</pageCount>");
			sb.append("<icref>"+dto.getIcref()+ "</icref>");
			sb.append("<iclev>"+dto.getIclev()+ "</iclev>");
			sb.append("<icstep>"+dto.getIcstep()+ "</icstep>");
			sb.append("<regdate>"+dto.getRegdate()+ "</regdate>");
			sb.append("</comment>");
		}		
		sb.append("</comm>");
		
		return sb.toString();
	}

	@RequestMapping("/infoboard/detail/icdelete")
	@ResponseBody
	public String delete(int icnum){
		int n=service.delete(icnum);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<result>");
		if(n>0){
			sb.append("<info>success</info>");
		}else{
			sb.append("<info>fail</info>");
		}
		sb.append("</result>");
		return sb.toString();
	}
	@RequestMapping(value="/infoboard/detail/icupdate",method=RequestMethod.GET)
	@ResponseBody
	public String update(int icnum,String comments){
		IfcommDto dto=new IfcommDto(icnum, 0, null, comments, 0, 0, 0, null);
		int n=service.update(dto);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<result>");
		if(n>0){
			sb.append("<info>success</info>");
		}else{
			sb.append("<info>fail</info>");
		}
		sb.append("</result>");
		return sb.toString();
	}
}
