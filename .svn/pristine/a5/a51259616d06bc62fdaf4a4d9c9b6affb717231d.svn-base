package com.gym.app.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.StandardServletEnvironment;
import org.springframework.web.servlet.ModelAndView;

import com.gym.app.dto.QnaDto;
import com.gym.app.service.QnaService;
import com.gym.app.util.PageUtil;

@Controller
public class QnaController {
	@Autowired private QnaService service;
	@RequestMapping(value="/qna/insert",method=RequestMethod.GET)
	public String insertForm(){
		return ".qna.insert";
	}
	@RequestMapping(value="/qna/insert",method=RequestMethod.POST)
	public String insertUser(QnaDto dto){
		try{
			int n=service.insert(dto);
			return "redirect:/qna/plist";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".qna.error";
		}
	}
	@RequestMapping("/qna/plist")
	public String plist(@RequestParam(value="pageNum",defaultValue="1")int pageNum,String sch_type,String sch_value,Model model){	
		HashMap<String, Object> map1=new HashMap<String, Object>();
		map1.put("sch_type", sch_type);
		map1.put("sch_value", sch_value);
		int rowCount=service.getCount(map1);
		PageUtil pu=new PageUtil(pageNum, rowCount,10, 10);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		map.put("sch_type", sch_type);
		map.put("sch_value", sch_value);
		List<QnaDto> list=service.plist(map);
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		model.addAttribute("sch_type", sch_type);
		model.addAttribute("sch_value", sch_value);
		return ".qna.showPageList";	
	}
	
	@RequestMapping("/qna/detail")
	public String detail(int qnanum,String sid,Model model) {
		QnaDto dto=service.getinfo(qnanum);
		QnaDto prev=service.prev(qnanum);
		QnaDto next=service.next(qnanum);
		String savefile=service.getPic(dto.getId());
		if(sid!=null){
		String savefile1=service.getPic(sid);
		model.addAttribute("savefile1", savefile1);
		}
		
		service.addHit(qnanum);
		model.addAttribute("dto",dto);
		model.addAttribute("prev", prev);
		model.addAttribute("next",next);
		model.addAttribute("savefile", savefile);
		
		return ".qna.detail";		
	}
	@RequestMapping(value="/qna/update",method=RequestMethod.GET)
	public String updateForm(int qnanum,Model model){
		QnaDto dto=service.getinfo(qnanum);
		model.addAttribute("dto", dto);
		return ".qna.update";
	}
	@RequestMapping(value="/qna/update",method=RequestMethod.POST)
	public String update(QnaDto dto, int qnanum) {
		try{
			int n=service.update(dto);
			// /qna/detail?qnanum=
			return "redirect:/qna/detail?qnanum="+qnanum;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".qna.error";
		}
	}
	@RequestMapping("/qna/delete")
	public String delete(int qnanum) {
		try{
			int n=service.delete(qnanum);
			return "redirect:/qna/plist";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".qna.error";
		}
	}
	@RequestMapping(value="/qna/photoUpload",method=RequestMethod.POST)
	public String photoUpload(HttpServletRequest request, PhotoVo vo){
	    String callback = vo.getCallback();
	    String callback_func = vo.getCallback_func();
	    String file_result = "";
	    try {
	        if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
	            //�뙆�씪�씠 議댁옱�븯硫�
	            String original_name = vo.getFiledata().getOriginalFilename();
	            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
	            //�뙆�씪 湲곕낯寃쎈줈
	            String defaultPath = request.getSession().getServletContext().getRealPath("/");
	            //�뙆�씪 湲곕낯寃쎈줈 _ �긽�꽭寃쎈줈
	            String path = defaultPath + "resources" + File.separator + "photo_upload" + File.separator;              
	            File file = new File(path);
	            System.out.println("path:"+path);
	            //�뵒�젆�넗由� 議댁옱�븯吏� �븡�쓣寃쎌슦 �뵒�젆�넗由� �깮�꽦
	            if(!file.exists()) {
	                file.mkdirs();
	            }
	            //�꽌踰꾩뿉 �뾽濡쒕뱶 �븷 �뙆�씪紐�(�븳湲�臾몄젣濡� �씤�빐 �썝蹂명뙆�씪�� �삱由ъ� �븡�뒗寃껋씠 醫뗭쓬)
	            String realname = UUID.randomUUID().toString() + "." + ext;
	        ///////////////// �꽌踰꾩뿉 �뙆�씪�벐湲� ///////////////// 
	            vo.getFiledata().transferTo(new File(path+realname));
	            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/resources/photo_upload/"+realname;
	        } else {
	            file_result += "&errstr=error";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "redirect:" + callback + "?callback_func="+callback_func+file_result;
	}
	//�떎以묓뙆�씪�뾽濡쒕뱶
	@RequestMapping(value="/qna/multiplePhotoUpload",method=RequestMethod.POST)
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
	    try {
	         //�뙆�씪�젙蹂�
	         String sFileInfo = "";
	         //�뙆�씪紐낆쓣 諛쏅뒗�떎 - �씪諛� �썝蹂명뙆�씪紐�
	         String filename = request.getHeader("file-name");
	         //�뙆�씪 �솗�옣�옄
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //�솗�옣�옄瑜쇱냼臾몄옄濡� 蹂�寃�
	         filename_ext = filename_ext.toLowerCase();
	         //�뙆�씪 湲곕낯寃쎈줈
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         //�뙆�씪 湲곕낯寃쎈줈 _ �긽�꽭寃쎈줈
	         String filePath = dftFilePath + "resources" + File.separator + "photo_upload" + File.separator;
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         System.out.println("寃쎈줈:"+filePath);
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         ///////////////// �꽌踰꾩뿉 �뙆�씪�벐湲� ///////////////// 
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();
	         ///////////////// �꽌踰꾩뿉 �뙆�씪�벐湲� /////////////////
	         // �젙蹂� 異쒕젰
	         sFileInfo += "&bNewLine=true";
	         // img �깭洹몄쓽 title �냽�꽦�쓣 �썝蹂명뙆�씪紐낆쑝濡� �쟻�슜�떆耳쒖＜湲� �쐞�븿
	         sFileInfo += "&sFileName="+ filename;;
	         sFileInfo += "&sFileURL="+"/resources/photo_upload/"+realFileNm;
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}
