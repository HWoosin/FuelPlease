package com.spring.fuelplease.reply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fuelplease.reply.mapper.IReplyMapper;
import com.spring.fuelplease.util.PageVO;
import com.spring.fuelplease.voCenter.ReplyVO;

@Service
public class ReplyService implements IReplyService {
	
	@Autowired
	private IReplyMapper mapper;

	@Override
	public void replyRegist(ReplyVO vo) {
		mapper.replyRegist(vo);
	}

	@Override
	public List<ReplyVO> getList(int bno, int pageNum) {
		PageVO vo = new PageVO();
		vo.setPageNum(pageNum);
		vo.setCpp(3); 
		Map<String, Object> data = new HashMap<>();
		data.put("paging", vo); 
		data.put("bno", bno); 
		return mapper.getList(data);
	}

	@Override
	public int getTotal(int bno) {
		return mapper.getTotal(bno);
	}

	@Override
	public void update(ReplyVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int rno) {
		mapper.delete(rno);
	}

}
