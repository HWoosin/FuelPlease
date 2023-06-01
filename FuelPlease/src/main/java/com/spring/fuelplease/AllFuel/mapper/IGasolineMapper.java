package com.spring.fuelplease.AllFuel.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring.fuelplease.voCenter.GasolineVO;

public interface IGasolineMapper {

	//주유소 정보 넣기
	void inputGasoline(GasolineVO vo);
	
	//주유소 찾기
	String findGasoline(@Param("keyword") String keyword);
}
