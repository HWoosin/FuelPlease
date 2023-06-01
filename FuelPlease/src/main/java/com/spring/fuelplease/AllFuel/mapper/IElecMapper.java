package com.spring.fuelplease.AllFuel.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.fuelplease.voCenter.ElecVO;

public interface IElecMapper {

	//전기차 충전소 정보 넣기
	void inputElec(ElecVO vo);
	
	//전기차 충전소 찾기
	List<String> findElec(@Param("keyword") String keyword);
}
