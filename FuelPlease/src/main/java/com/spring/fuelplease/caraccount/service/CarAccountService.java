package com.spring.fuelplease.caraccount.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fuelplease.caraccount.mapper.ICarAccountMapper;
import com.spring.fuelplease.util.PageVO;
import com.spring.fuelplease.voCenter.CarAccountVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CarAccountService implements ICarAccountService {
	
	@Autowired
	public ICarAccountMapper mp;

	// 등록
	@Override
	public void regist(CarAccountVO vo) {
		mp.regist(vo);
	}
	
	// 목록 불러오기
	@Override
	public List<CarAccountVO> accountList(PageVO vo) {
		return mp.accountList(vo);
	}

	// 총 등록 수
	@Override
	public int getTotal(PageVO vo) {
		return mp.getTotal(vo);
	}
	
	// 상세 보기
	@Override
	public CarAccountVO getContent(int acno) {
		return mp.getContent(acno);
	}
	
	// 수정
	@Override
	public void update(CarAccountVO vo) {
		mp.update(vo);
	}

	// 삭제
	@Override
	public void delete(int acno) {
		mp.delete(acno);
	}

	

}
