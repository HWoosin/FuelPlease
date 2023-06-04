package com.spring.fuelplease.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.events.Event;
import org.w3c.dom.events.EventTarget;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/caraccount")
@Slf4j
public class carAccountController {

	// Car Account 페이지 이동 요청
	@GetMapping("/carAccount")
	public void carAccount() {
		
	}
	
	
}