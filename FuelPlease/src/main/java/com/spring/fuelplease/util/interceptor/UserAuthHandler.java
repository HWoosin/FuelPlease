package com.spring.fuelplease.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class UserAuthHandler implements HandlerInterceptor {

<<<<<<< HEAD
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
=======
	//회원 권한이 필요한 페이지 요청이 들어왔을 때, 컨트롤러보다 먼저 요청을 가로채서
	//확인할 인터셉터로 사용합니다.
	//글쓰기 화면, 마이페이지 화면으로 돌아가는 요청을 가로채 검사하도록 합시다.
	//권한이 없다면 로그인 페이지로 보내버리겠습니다.

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		//세션에서 로그인 데이터를 얻은 후 확인해 보겠습니다.
>>>>>>> 1e70f3e291e31d9e439ce29db5cc70ee1acb117f
		HttpSession session = request.getSession();

		if(session.getAttribute("login") == null) {
			response.sendRedirect(request.getContextPath() + "/user/userLogin");
			return false;
		}
<<<<<<< HEAD
		//로그인했으면 통과
=======

		// 로그인을 했다면 통과~
>>>>>>> 1e70f3e291e31d9e439ce29db5cc70ee1acb117f
		return true;
	}








}
