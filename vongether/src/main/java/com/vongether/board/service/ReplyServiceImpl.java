package com.vongether.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vongether.board.dao.ReplyDAO;
import com.vongether.board.model.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ReplyVO> selectReplyList(int bNo){
		List<ReplyVO> list = sqlSession.getMapper(ReplyDAO.class).selectReplyList(bNo); 
		for(int i=0;i<list.size();i++) {//테그삭제, 유효성체크
			String content = list.get(i).getrContent().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
			list.get(i).setrContent(content);
		}
		return list;
	}
	@Override
	public int totalReplyCount(int bNo) {
		return sqlSession.getMapper(ReplyDAO.class).totalReplyCount(bNo);
	}
	@Override
	public void writeReply(ReplyVO replyVO){
		sqlSession.getMapper(ReplyDAO.class).writeReply(replyVO);
	}
	@Override
	public void updateReply(Map<String, Object> map){
		sqlSession.getMapper(ReplyDAO.class).updateReply(map);
	}
	@Override
	public void deleteReply(int rNo){
		sqlSession.getMapper(ReplyDAO.class).deleteReply(rNo);
	}
}
