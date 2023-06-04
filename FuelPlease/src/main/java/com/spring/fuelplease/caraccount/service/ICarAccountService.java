package com.spring.fuelplease.caraccount.service;

import java.util.List;

import com.spring.fuelplease.voCenter.carAccountVO;

public interface ICarAccountService {

	// 목록 가져오기
	List<String> calendarList();
	
	// 삭제하기
	void deleteAccount(carAccountVO vo);
	
	// 등록하기	
	void addAccount(carAccountVO vo);
	
	
}
