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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gym.app.dto.EpboardDto;
import com.gym.app.service.EpboardService;
import com.gym.app.util.PageUtil;





@Controller
public class EpboardController {
	@Autowired private EpboardService service;
	@RequestMapping(value="/epboard/insert",method=RequestMethod.GET)
	public String insertForm(){
		return ".epboard.insert";
	}
	@RequestMapping(value="/epboard/insert",method=RequestMethod.POST)
	public String insertUser(EpboardDto dto){
		try{
			int n=service.insert(dto);
			return ".epboard.success";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".epboard.error";
		}
	}
	@RequestMapping("/epboard/plist")
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
		List<EpboardDto> list=service.plist(map);
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		model.addAttribute("sch_type", sch_type);
		model.addAttribute("sch_value", sch_value);
		return ".epboard.showPageList";	
	}
	@RequestMapping("/epboard/detail")
	public String detail(int epnum,String sid,Model model) {
		EpboardDto dto=service.getinfo(epnum);
		EpboardDto prev=service.prev(epnum);
		EpboardDto next=service.next(epnum);
		String savefile=service.getPic(dto.getId());
		if(sid!=null){
			String savefile1=service.getPic(sid);
			model.addAttribute("savefile1", savefile1);
			}
		service.addHit(epnum);
		model.addAttribute("dto",dto);
		model.addAttribute("prev", prev);
		model.addAttribute("next",next);
		model.addAttribute("savefile", savefile);
		
		return ".epboard.detail";		
	}
	@RequestMapping(value="/epboard/update",method=RequestMethod.GET)
	public String updateForm(int epnum,Model model){
		EpboardDto dto=service.getinfo(epnum);
		model.addAttribute("dto", dto);
		return ".epboard.update";
	}
	@RequestMapping(value="/epboard/update",method=RequestMethod.POST)
	public String update(EpboardDto dto,int epnum) {
		try{
			int n=service.update(dto);
			return "redirect:/epboard/detail?epnum="+epnum;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".epboard.error";
		}
	}
	@RequestMapping("/epboard/delete")
	public String delete(int epnum) {
		try{
			int n=service.delete(epnum);
			return ".epboard.success";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".epboard.error";
		}
	}
	@RequestMapping(value="/epboard/photoUpload",method=RequestMethod.POST)
	public String photoUpload(HttpServletRequest request, PhotoVo vo){
	    String callback = vo.getCallback();
	    String callback_func = vo.getCallback_func();
	    String file_result = "";
	    try {
	        if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
	            //파일이 존재하면
	            String original_name = vo.getFiledata().getOriginalFilename();
	            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
	            //파일 기본경로
	            String defaultPath = request.getSession().getServletContext().getRealPath("/");
	            //파일 기본경로 _ 상세경로
	            String path = defaultPath + "resources" + File.separator + "photo_upload" + File.separator;              
	            File file = new File(path);
	            System.out.println("path:"+path);
	            //디렉토리 존재하지 않을경우 디렉토리 생성
	            if(!file.exists()) {
	                file.mkdirs();
	            }
	            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
	            String realname = UUID.randomUUID().toString() + "." + ext;
	        ///////////////// 서버에 파일쓰기 ///////////////// 
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
	//다중파일업로드
	@RequestMapping(value="/epboard/multiplePhotoUpload",method=RequestMethod.POST)
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
	    try {
	         //파일정보
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         //파일 확장자
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         //파일 기본경로
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         //파일 기본경로 _ 상세경로
	         String filePath = dftFilePath + "resources" + File.separator + "photo_upload" + File.separator;
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         System.out.println("경로:"+filePath);
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         ///////////////// 서버에 파일쓰기 ///////////////// 
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
	         ///////////////// 서버에 파일쓰기 /////////////////
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
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
