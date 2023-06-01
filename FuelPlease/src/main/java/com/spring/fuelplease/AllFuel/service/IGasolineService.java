package com.spring.fuelplease.AllFuel.service;

import java.util.List;

public interface IGasolineService {

	//주유소 주입
	void inputGasoline();
	
	//주유소 찾기
	List<String> findGasoline(String keyword);
}
