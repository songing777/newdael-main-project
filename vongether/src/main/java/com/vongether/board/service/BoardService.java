package com.vongether.board.service;

import java.util.List;
import java.util.Map;

import com.vongether.board.model.BoardVO;

public interface BoardService {

	public List<BoardVO> selectNoticeTop3();
	public List<BoardVO> selectBoardList(Map<String, Object> param, int pageNo);
	public BoardVO selectBoardArticle(int bNo);
	public int writeBoardArticle(BoardVO boardVO);
	public void updateBoardArticle(BoardVO boardVO);
	public void deleteBoardArticle(int bNo);
	public void increaseHitcount(int bNo);
	public int totalBoardArticleCount(Map<String, Object> param);
}
