package com.spring.fuelplease.AllFuel.service;

public interface IGasolineService {

	//주유소 주입
	void inputGasoline();
	
	//주유소 찾기
	String findGasoline(String keyword);
}
