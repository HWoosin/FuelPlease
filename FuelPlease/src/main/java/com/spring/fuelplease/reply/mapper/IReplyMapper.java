package com.spring.fuelplease.reply.mapper;

import java.util.List;
import java.util.Map;

import com.spring.fuelplease.voCenter.ReplyVO;

public interface IReplyMapper {

	//댓글 등록
	void replyRegist(ReplyVO vo);

	//목록 요청
	List<ReplyVO> getList(Map<String, Object> data); //int bno, PageVO paging 대신 맵 활용

	//댓글 개수(페이징)
	int getTotal(int bno); //페이징, PageCreator은 사용하지 않습니다.

	//댓글 수정
	void update(ReplyVO vo);

	//댓글 삭제
	void delete(int rno);

}
