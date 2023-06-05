package com.spring.fuelplease.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.events.Event;
import org.w3c.dom.events.EventTarget;

import com.spring.fuelplease.caraccount.service.CarAccountService;
import com.spring.fuelplease.voCenter.carAccountVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/caraccount")
@Slf4j
public class carAccountController {

	@Autowired
	private CarAccountService sv;
	
	// Car Account 페이지 이동 요청
	@GetMapping("/carAccount")
	public void carAccount() {
		
	}
	
	// 등록
	@PostMapping("/addAccount")
	@ResponseBody
	public void addAccount(HttpSession session, @RequestBody carAccountVO vo) {		
		vo.setWriter((String) session.getAttribute("login"));
		sv.addAccount(vo);		
	}
	
	
}