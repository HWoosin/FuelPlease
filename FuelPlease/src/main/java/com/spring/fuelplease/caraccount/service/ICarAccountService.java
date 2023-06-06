package com.spring.fuelplease.caraccount.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.fuelplease.util.PageVO;
import com.spring.fuelplease.voCenter.CarAccountVO;

@Service
public interface ICarAccountService {
	
	// 등록
	void regist(CarAccountVO vo);
	
	// 목록
	List<CarAccountVO> accountList (PageVO vo);
	
	// 상세보기
	CarAccountVO getContent(int acno);
	
	//총 등록 수 구하기
	int getTotal(PageVO vo);
		
	// 수정
	void update(CarAccountVO vo);	
		
	// 삭제
	void delete(int acno);
	
}
