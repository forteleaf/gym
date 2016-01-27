package com.gym.app.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gym.app.dto.NoticeDto;
import com.gym.app.dto.QnaDto;
import com.gym.app.service.NoticeService;
import com.gym.app.service.QnaService;

@Controller
public class HomeController {
	@Autowired QnaService qnaService;
	@Autowired NoticeService noticeService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		List<QnaDto> qnalist = qnaService.alramQna();
		List<NoticeDto> noticelist = noticeService.alramNotice();
		model.addAttribute("qnalist",qnalist);
		model.addAttribute("noticelist",noticelist);		
		model.addAttribute("serverTime", formattedDate );
		
		return ".main";
	}
	
	@RequestMapping("/info/location")
	public String ComeOn(){
		return ".info.location";
	}
	//소개하는 글
	@RequestMapping("/info/welcome")
	public String welcome(){
		return ".info.welcome";
	}
	//이용안내
	@RequestMapping("/info/info")
	public String information(){
		return ".info.info";
	}
	
	//테스트
	@RequestMapping("/test")
	public String test(){
		return "redirect:/";
	}
	
	
}
