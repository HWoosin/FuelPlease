package com.spring.fuelplease.AllFuel.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.fuelplease.voCenter.LpgVO;

public interface ILpgMapper {

	//LPG 충전소 정보 넣기
	void inputLpg(LpgVO vo);
	
	//LPG 충전소 찾기
	List<String> findLpg(@Param("keyword") String keyword);
	
	//LPG 충전소 정보 찾기
	LpgVO getInfo(@Param("loadId") String loadId);
}
