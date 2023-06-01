package com.spring.fuelplease.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/caraccount")
@Slf4j
public class carAccountController {

	// 목록 화면
	@GetMapping("/carAccount")
	public void carAccount() {
		
	}
	
}
