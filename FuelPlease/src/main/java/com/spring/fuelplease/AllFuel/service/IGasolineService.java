package com.spring.fuelplease.AllFuel.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.fuelplease.voCenter.BookMarkVO;
import com.spring.fuelplease.voCenter.GasolineVO;

public interface IGasolineService {

	//주유소 주입
	void inputGasoline();
	
	//주유소 찾기
	List<String> findGasoline(String keyword);
	
	//주유소 정보 찾기
	GasolineVO getGasolineInfo(@Param("loadId") String loadId);
	
	//즐겨찾기 추가
	void addBookmarkGas(BookMarkVO vo);
	
	//즐겨 찾기 중복 확인
	int bookCheck(String bkaddr, String bkuserId);
}
