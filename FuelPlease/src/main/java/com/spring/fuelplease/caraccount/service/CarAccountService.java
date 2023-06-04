package com.spring.fuelplease.caraccount.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fuelplease.caraccount.mapper.ICarAccountMapper;
import com.spring.fuelplease.voCenter.carAccountVO;

@Service
public class CarAccountService implements ICarAccountService {

	@Autowired
	private ICarAccountMapper mp;
	
	@Override
	public ArrayList<String> calendarList() {
		return null;
	}

	@Override
	public void deleteAccount(carAccountVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addAccount(carAccountVO vo) {
		mp.addAccount(vo);
		
	}

}
