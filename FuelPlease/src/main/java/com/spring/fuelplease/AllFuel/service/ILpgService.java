package com.spring.fuelplease.AllFuel.service;

import java.util.List;

public interface ILpgService {

	//전기차 충전소 정보 넣기
	void inputLpg();
	
	//전기차 충전소 찾기
	List<String> findLpg(String keyword);

}
