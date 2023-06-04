package com.spring.fuelplease.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.fuelplease.AllFuel.service.IElecService;
import com.spring.fuelplease.AllFuel.service.IGasolineService;
import com.spring.fuelplease.AllFuel.service.ILpgService;
import com.spring.fuelplease.voCenter.ElecVO;
import com.spring.fuelplease.voCenter.GasolineVO;
import com.spring.fuelplease.voCenter.LpgVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mapview")
@Slf4j
public class KakaoMapController {
	
	@Autowired
	private IGasolineService gsv;
	
	@Autowired
	private IElecService esv;
	
	@Autowired
	private ILpgService lsv;
	
	@GetMapping("/inputGasoline")
	public void inputG() {
		log.info("주유소 정보 주입");
		gsv.inputGasoline();
	}
	
	@GetMapping("/inputElec")
	public void inputE() {
		log.info("전기차 정보 주입");
		esv.inputElec();
	}

	@GetMapping("/inputLpg")
	public void inputL() {
		log.info("LPG 정보 주입");
		lsv.inputLpg();
	}

	//주유소
	@GetMapping("/gasolineMap")
	public void findGasoline() {
		log.info("주유소 맵으로~");
	}
	
	//~~구의 도로명들 가져오기
	@PostMapping("/gasolineMap")
	@ResponseBody
	public List<String> findGasoline(@RequestBody String keyword) {
		List<String> spot = gsv.findGasoline(keyword);
//		log.info(spot);
//		model.addAttribute("spot",spot);
		return spot;
	}
	
	///전기차
	@GetMapping("/elecChargeMap")
	public void findElec() {
		log.info("전기차 충전소 맵으로~");
	}
	
	@PostMapping("/elecChargeMap")
	@ResponseBody
	public List<String> findElec(@RequestBody String keyword) {
		List<String> spot = esv.findElec(keyword);
//		log.info(spot);
//		model.addAttribute("spot",spot);
		return spot;
	}
	
	@GetMapping("/lpgMap")
	public void findLpg() {
		log.info("LPG 충전소 맵으로~");
	}
	
	@PostMapping("/lpgMap")
	@ResponseBody
	public List<String> findLpg(@RequestBody String keyword) {
		List<String> spot = lsv.findLpg(keyword);
//		log.info(spot);
//		model.addAttribute("spot",spot);
		return spot;
	}
	
	@PostMapping("/lpgMapInfo")
	@ResponseBody
	public LpgVO getInfo(@RequestBody String loadId) {
		
		return lsv.getInfo(loadId);
	}
	
	@PostMapping("/gasolineMapInfo")
	@ResponseBody
	public GasolineVO getGasolineInfo(@RequestBody String loadId) {
		
		return gsv.getGasolineInfo(loadId);
	}
	
	@PostMapping("/elecMapInfo")
	@ResponseBody
	public ElecVO getElecInfo(@RequestBody String loadId) {
		return esv.getElecInfo(loadId);
	}
	
	
	
	
	
}
