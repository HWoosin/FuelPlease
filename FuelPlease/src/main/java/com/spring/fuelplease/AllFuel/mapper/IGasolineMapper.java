package com.spring.fuelplease.AllFuel.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.fuelplease.voCenter.GasolineVO;

public interface IGasolineMapper {

	//주유소 정보 넣기
	void inputGasoline(GasolineVO vo);
	
	//주유소 찾기
	List<String> findGasoline(@Param("keyword") String keyword);

	//주유소 정보 찾기
	GasolineVO getGasolineInfo(@Param("loadId") String loadId);
}
