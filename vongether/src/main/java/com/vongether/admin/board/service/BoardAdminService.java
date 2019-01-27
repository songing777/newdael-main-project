package com.vongether.admin.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import com.vongether.board.model.BoardVO;
import com.vongether.intro.dao.IntroDAO;

public interface BoardAdminService {
  
  public List<BoardVO> selectBoardList(Map<String, Object> map);
  
  public BoardVO selectBoard(int bNo);
  
  public void insertNotice(BoardVO boardVO);
  
  public List<BoardVO> selectNoticeList(Map<String, Object> map);
  
  public int selectBoardCnt(Map<String, Object> map);
  
  public int selectNoticeCnt(Map<String, Object> map);
  
  public void deleteBoard(int bNo);
  
  public void deleteBoardCancle(int bNo);
  
  public void updateNotice(BoardVO boardVO);
  
  public List<Map<String, Object>> dayTop3(@RequestBody Map<String, Object> params);
  
  public List<Map<String, Object>> weekTop3(@RequestBody Map<String, Object> params);
  
  public List<Map<String, Object>> monthTop3(@RequestBody Map<String, Object> params);
  
  public List<Map<String, Object>> monthAppl(@RequestBody String key);

  public int dayVisit();
  
  public int monthVisit();

}
