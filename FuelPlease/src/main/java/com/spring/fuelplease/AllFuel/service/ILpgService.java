package com.spring.fuelplease.AllFuel.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.fuelplease.voCenter.BookMarkVO;
import com.spring.fuelplease.voCenter.LpgVO;

public interface ILpgService {

	//LPG 충전소 정보 넣기
	void inputLpg();
	
	//LPG 충전소 찾기
	List<String> findLpg(String keyword);

	//LPG 충전소 정보 찾기
	LpgVO getInfo(@Param("loadId") String loadId);
	
	//즐겨찾기 추가
	void addBookmarkGas(BookMarkVO vo);
	
	
	
}
