package com.spring.fuelplease.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.fuelplease.AllFuel.service.IGasolineService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mapview")
@Slf4j
public class KakaoMapController {
	
	@Autowired
	private IGasolineService gsv;

	@GetMapping("/gasolineMap")
	public void goMap() {
		log.info("카카오 맵으로~");
	}
	
	//~~구의 도로명들 가져오기
	@PostMapping("/gasolineMap")
	@ResponseBody
	public void findGasoline(@RequestBody String keyword) {
		String spot = gsv.findGasoline(keyword);
		log.info(spot);
	}
	
	@GetMapping("/inputGasoline")
	public void inputG() {
		log.info("주유소 정보 주입");
		gsv.inputGasoline();
	}
	
}
