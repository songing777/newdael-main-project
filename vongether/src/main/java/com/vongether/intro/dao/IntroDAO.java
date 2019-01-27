package com.vongether.intro.dao;

import java.util.List;

import com.vongether.board.model.BoardVO;
import com.vongether.intro.model.VisitCountVO;

public interface IntroDAO {
	int visitCount(VisitCountVO viCountVO);
	List<BoardVO> getNoticeTop3();
}
