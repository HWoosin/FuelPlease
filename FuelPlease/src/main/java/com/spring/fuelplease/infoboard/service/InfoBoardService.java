package com.spring.fuelplease.infoboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fuelplease.infoboard.mapper.IInfoBoardMapper;
import com.spring.fuelplease.util.PageVO;
import com.spring.fuelplease.voCenter.InfoBoardVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class InfoBoardService implements IInfoBoardService {

	@Autowired
	private IInfoBoardMapper mapper;

	@Override
	public void regist(InfoBoardVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<InfoBoardVO> getList(PageVO vo) {
		return mapper.getList(vo);
	}

	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}

	@Override
	public InfoBoardVO getContent(int bno) {
		return mapper.getContent(bno);
	}

	@Override
	public void update(InfoBoardVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int bno) {
		mapper.delete(bno);
	}


}
