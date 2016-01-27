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

import com.gym.app.dto.EpcommDto;
import com.gym.app.service.EpcommService;
import com.gym.app.util.PageUtil;


@Controller
public class EpcommController {
	@Autowired private EpcommService service;
	@RequestMapping(value="/epboard/detail/ecinsert",method=RequestMethod.GET)
	@ResponseBody
	public String insert(int ecnum,int epnum,String id,String comments,int ecref,int eclev,int ecstep){
		EpcommDto dto=new EpcommDto(ecnum, epnum, id, comments,ecref,eclev,ecstep,null);
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
	@RequestMapping("/epboard/detail/eclist")
	@ResponseBody
	public String list(@RequestParam(value="pageNum",defaultValue="1")int pageNum,int epnum,String sid,Model model) throws Exception{
		int rowCount=service.getCount(epnum);
		System.out.println("pageNum:"+pageNum);
		PageUtil pu=new PageUtil(pageNum, rowCount,10, 10);
		HashMap<String , Integer> map=new HashMap<String, Integer>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		map.put("epnum", epnum);
		List<EpcommDto> list=service.list(map);
		
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<comm>");
		for(EpcommDto dto:list){
			sb.append("<comment>");
			sb.append("<ecnum>" + dto.getEcnum() +"</ecnum>");
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
			sb.append("<ecref>"+dto.getEcref()+ "</ecref>");
			
			sb.append("<eclev>"+dto.getEclev()+ "</eclev>");
			sb.append("<ecstep>"+dto.getEcstep()+ "</ecstep>");
			sb.append("<regdate>"+dto.getRegdate()+ "</regdate>");
			sb.append("</comment>");
		}		
		sb.append("</comm>");
		
		return sb.toString();
	}
	@RequestMapping("/epboard/detail/ecdelete")
	@ResponseBody
	public String delete(int ecnum){
		int n=service.delete(ecnum);
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
	@RequestMapping(value="/epboard/detail/ecupdate",method=RequestMethod.GET)
	@ResponseBody
	public String update(int ecnum,String comments){
		EpcommDto dto=new EpcommDto(ecnum, 0, null, comments, 0, 0, 0, null);
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
