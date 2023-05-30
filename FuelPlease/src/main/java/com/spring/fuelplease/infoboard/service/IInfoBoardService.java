package com.spring.fuelplease.infoboard.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.fuelplease.util.PageVO;
import com.spring.fuelplease.voCenter.InfoBoardVO;

@Service
public interface IInfoBoardService {
	
	//글 등록
	void regist(InfoBoardVO vo);
	
	//글 목록
	List<InfoBoardVO> getList(PageVO vo);
	
	//총 게시물 수 구하기
	int getTotal(PageVO vo);
	
	//상세보기
	InfoBoardVO getContent(int bno);
	
	//수정
	void update(InfoBoardVO vo);
	
	//삭제
	void delete(int bno);
	
	















}
