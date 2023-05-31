package com.spring.fuelplease.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.fuelplease.user.service.IUserService;
import com.spring.fuelplease.util.MailSenderService;
import com.spring.fuelplease.voCenter.UserVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user")
@Slf4j
public class UserController {

	@Autowired
	private IUserService sv;
	@Autowired
	private MailSenderService mailsv;

	@GetMapping("/userLogin") // 로그인 페이지 이동
	public void loginPage() {

	}

	@PostMapping("/userLogin")// 로그인 요청
	public void login(String userId, String userPw, Model model) {
		log.info("사용자 로그인 요청!");
		model.addAttribute("user", sv.userLogin(userId, userPw));// user에 정보 담아 보냄
<<<<<<< HEAD
=======

>>>>>>> dev
	}

	@GetMapping("/userJoin") // 회원 가입 페이지 이동
	public void join() {

	}

	@PostMapping("/userJoin") // 가입 후 홈으로 이동
	public String join(UserVO vo, RedirectAttributes ra) {
		sv.userJoin(vo);
		ra.addFlashAttribute("msg", "joinSuccess"); //msg에 메세지 담아 보내서 이것으로 판단할것임

		return "redirect:/";
	}

	@PostMapping("/idCheck") // 아이디중복체크
	@ResponseBody
	public int idCheck(@RequestBody String id) {
		log.info("사용자가 입력한 아이디: " + id);
		if (sv.idCheck(id) == 1) {//중복이면 1반환
			return 1;
		} else
			return 0;
	}

	@GetMapping("/mailCheck") // 이메일 인증
	@ResponseBody
	public String mailCheck(String email) {
		log.info("이메일 인증 요청 들어옴: " + email);
		return mailsv.joinEmail(email);
	}

	// 마이페이지 이동 요청
	@GetMapping("/userMypage")
	public void userMypage(HttpSession session, Model model) {
		String id = (String) session.getAttribute("login");
		model.addAttribute("userInfo", sv.getInfo(id));
	}
	
	@GetMapping("/userDelete")
	public void userDelete(HttpSession sessison) {
		
	}

}
