package com.vongether.intro.service;

import java.util.List;

import com.vongether.board.model.BoardVO;
import com.vongether.intro.model.VisitCountVO;

public interface IntroService {
  int visitCount(VisitCountVO viCountVO);
  List<BoardVO> getNoticeTop3();
}
