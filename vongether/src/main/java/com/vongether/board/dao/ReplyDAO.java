package com.vongether.board.dao;

import java.util.List;
import java.util.Map;

import com.vongether.board.model.ReplyVO;

public interface ReplyDAO {
	List<ReplyVO> selectReplyList(int bNo);
	int totalReplyCount(int bNo);
	void writeReply(ReplyVO replyVO);
	void updateReply(Map<String, Object> map);
	void deleteReply(int rNo);
}
