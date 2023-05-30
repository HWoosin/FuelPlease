package com.spring.fuelplease.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UserLoginSuccessHandler implements HandlerInterceptor {

	//preHandle은 컨트롤러로 요청이 들어가기 전 처리해야 할 로직을 작성.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("preHandle 접근");
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		log.info("로그인 인터셉터가 동작!");
		log.info("요청 방식" + request.getMethod());
		
		if(request.getMethod().equals("POST")) {
			ModelMap map = modelAndView.getModelMap(); //모델 객체 꺼내기
			String id = (String) map.get("user"); //모델 내에 user라는 이름의 데이터 꺼내기
			
			if(id != null) { //로그인 성공
				log.info("로그인 성공 로직이 동작합니다.");
				//로그인 성공한 회원에게 세션 데이터를 생성해서 로그인 유지를 하게 해 줌.
				HttpSession session = request.getSession();
				session.setAttribute("login", id);
				log.info((String) session.getAttribute("login"));
				log.info(id);
				response.sendRedirect(request.getContextPath() + "/");
				
			} else { //vo == null -> 로그인 실패
				modelAndView.addObject("msg", "loginFail");
			}
			
		}
		
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
