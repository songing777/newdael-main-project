package com.vongether.board.service;

import java.util.List;
import java.util.Map;

import com.vongether.board.model.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> selectReplyList(int bNo);
	public int totalReplyCount(int bNo);
	public void writeReply(ReplyVO replyVO);
	public void deleteReply(int rNo);
	public void updateReply(Map<String, Object> map);
}
