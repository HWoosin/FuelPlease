package com.spring.fuelplease.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.fuelplease.util.PageVO;
import com.spring.fuelplease.voCenter.BookMarkVO;
import com.spring.fuelplease.voCenter.UserVO;

public interface IUserMapper {

	//회원정보 얻어오기

	//로그인
	String userLogin(String id);
	
	//회원가입
	void userJoin(UserVO vo);

	//아이디 중복확인
	int idCheck(String id);

	//회원정보 얻어오기
	UserVO getInfo(@Param("userId") String id, @Param("paging") PageVO vo);

	//회원정보 수정
	void updateUser(UserVO vo);
	
	//회원 탈퇴
	void deleteUser(@Param("userId")String id, @Param("userPw")String userPw);

	//회원의 북마크 조회
	List<String> userBookmark(String id);
	
	//회원의 조회한데이터 상세보기
	BookMarkVO showBookmark(@Param("userId") String id, @Param("bkaddr") String bkaddr);
	
	//회원의 즐겨찾기 삭제
	void deleteBookmark(@Param("userId") String id, @Param("bkaddr") String bkaddr);
}
