package com.spring.fuelplease.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mapview")
@Slf4j
public class KakaoMapController {

	@GetMapping("/kakaoMap")
	public void goMap() {
		log.info("카카오 맵으로~");
	}
}
