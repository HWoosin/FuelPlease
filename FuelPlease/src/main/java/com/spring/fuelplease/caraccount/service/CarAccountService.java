package com.spring.fuelplease.caraccount.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fuelplease.caraccount.mapper.ICarAccountMapper;
import com.spring.fuelplease.voCenter.carAccountVO;

@Service
public class CarAccountService implements ICarAccountService {

	@Autowired
	private ICarAccountMapper mp;
	
	// 등록
	@Override
	public void addAccount(carAccountVO vo) {
		mp.addAccount(vo);		
	}
	
	@Override
	public List<String> calendarList() {
		return null;
	}
	
	// 삭제
	@Override
	public void deleteAccount(carAccountVO vo) {
		
	}


}
