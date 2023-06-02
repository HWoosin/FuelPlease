package com.spring.fuelplease.AllFuel.service;

import java.util.List;

import com.spring.fuelplease.voCenter.ElecVO;

public interface IElecService {
	
	//전기차 충전소 정보 넣기
	void inputElec();
	
	//전기차 충전소 찾기
	List<String> findElec(String keyword);

}
