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
	List<CarAccountVO> getList (PageVO vo);


	//총 등록 수 구하기
	int getTotal(PageVO vo);


	// 삭제
	void delete(int acno);

	// 총 가격 구하기
	String getPriceTotal(String id);

	// 가격 평균 구하기
	String getPriceAvg(String id);
	
	

}
