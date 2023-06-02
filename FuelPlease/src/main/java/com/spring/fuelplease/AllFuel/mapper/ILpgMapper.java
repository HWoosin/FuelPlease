package com.spring.fuelplease.AllFuel.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.fuelplease.voCenter.LpgVO;

public interface ILpgMapper {

	//전기차 충전소 정보 넣기
	void inputLpg(LpgVO vo);
	
	//전기차 충전소 찾기
	List<String> findLpg(@Param("keyword") String keyword);
	
}
