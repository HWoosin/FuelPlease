package com.spring.fuelplease.user.service;

import java.util.List;

import com.spring.fuelplease.util.PageVO;
import com.spring.fuelplease.voCenter.BookMarkVO;
import com.spring.fuelplease.voCenter.UserVO;

public interface IUserService {

	//회원정보 얻어오기
	UserVO getInfo(String id, PageVO vo);

	//로그인
	String userLogin(String id, String pw);

	//회원가입
	void userJoin(UserVO vo);

	//아이디 중복확인
	int idCheck(String id);

	//회원정보 수정
	void updateUser(UserVO vo);
	
	//회원 삭제
	int deleteUser(String id, String pw);
	
	//회원의 북마크 조회
	List<String> userBookmark(String id);
	
	//회원의 조회한데이터 상세보기
	BookMarkVO showBookmark(String id, String bkaddr);

}
