package com.vongether.admin.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import com.vongether.board.model.BoardVO;

public interface BoardAdminDAO {
  
	List<BoardVO> selectBoardList(Map<String, Object> map);
	
	public BoardVO selectBoard(int bNo);
	
	public void insertNotice(BoardVO boardVO);
	
	public List<BoardVO> selectNoticeList(Map<String, Object> map);
	
	public int selectBoardCnt(Map<String, Object> map);
	
	public int selectNoticeCnt(Map<String, Object> map);
	
	public void deleteBoard(int bNo);
	
	public void deleteBoardCancle(int bNo);
	
	public void updateNotice(BoardVO boardVO);

	public List<Map<String, Object>> dayReplyTop3(Map<String, Object> params);
	
	public List<Map<String, Object>> weekReplyTop3(Map<String, Object> params);
	
	public List<Map<String, Object>> monthReplyTop3(Map<String, Object> params);
	
	public List<Map<String, Object>> dayBoardTop3(Map<String, Object> params);
	
	public List<Map<String, Object>> weekBoardTop3(Map<String, Object> params);
	
	public List<Map<String, Object>> monthBoardTop3(Map<String, Object> params);

	public List<Map<String, Object>> monthApplTop3(Map<String, Object> params);
	
	public List<Map<String, Object>> monthAppl(String key);
	
	public int dayVisit();
	
	public int monthVisit();

}
