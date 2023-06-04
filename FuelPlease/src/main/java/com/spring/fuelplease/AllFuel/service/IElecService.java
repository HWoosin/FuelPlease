package com.spring.fuelplease.AllFuel.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.fuelplease.voCenter.ElecVO;

public interface IElecService {
	
	//전기차 충전소 정보 넣기
	void inputElec();
	
	//전기차 충전소 찾기
	List<String> findElec(String keyword);
	
	//전기차 충전소 정보 찾기
	ElecVO getElecInfo(@Param("loadId") String loadId);

}
