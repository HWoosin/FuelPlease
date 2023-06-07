package com.spring.fuelplease.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.fuelplease.caraccount.service.CarAccountService;
import com.spring.fuelplease.caraccount.service.ICarAccountService;
import com.spring.fuelplease.infoboard.service.IInfoBoardService;
import com.spring.fuelplease.util.PageCreator;
import com.spring.fuelplease.util.PageVO;
import com.spring.fuelplease.voCenter.CarAccountVO;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/caraccount")
@Slf4j
public class CarAccountController {
	
	@Autowired
	public CarAccountService sv;
	@Autowired
	public ICarAccountService acsv;
	
	// 차계부 페이지 이동 요청
	@GetMapping("/accountList")
	public void accountList(HttpSession session, PageVO vo, Model model) {
		String id = (String) session.getAttribute("login");
		vo.setLoginId(id);
		PageCreator apc = new PageCreator(vo, acsv.getTotal(vo));
		model.addAttribute("accountList", acsv.getList(vo));
		model.addAttribute("apc", apc);
	}
	
	// 등록 페이지 열기
	@GetMapping("/regist")
	public String regist() {
		return "/caraccount/accountRegist";
	}
	
	// 차계부 등록
	@PostMapping("/regist")
	public String regist(HttpSession session, CarAccountVO vo) {
		String id = (String) session.getAttribute("login");
		vo.setWriter(id);
		sv.regist(vo);
		return "redirect:/caraccount/accountList";
	}
	
	// 삭제 처리
	@PostMapping("/delete")
	@ResponseBody
	public String delete(@RequestBody int acno) {
		sv.delete(acno);
		return "deleteSuccess";
	}
	
	
	
	
	
}
	





















	
	
	
	
	
