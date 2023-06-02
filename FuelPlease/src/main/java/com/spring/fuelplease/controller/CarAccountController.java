package com.spring.fuelplease.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/caraccount")
@Slf4j
public class CarAccountController {

	// Car Account 페이지 이동 요청
	@GetMapping("/carAccount")
	public void carAccount() {
		
	}
	
	// 작성
	@PostMapping("/accountRegist")
	public String accountRegist() {
		return null;
		
	}
	
	// 수정
	@PostMapping("/accountUpdate")
	public String accountUpdate() {
		return null;
		
	}
	
	// 삭제
	@DeleteMapping("/accountDelete")
	public void accountDelete() {
		
	}
	
}
