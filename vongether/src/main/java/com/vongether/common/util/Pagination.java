package com.vongether.common.util;

public class Pagination {

  private int pageSize; 	 	/** 한 페이지당 게시글 수 **/
  private int rangeSize = 10;	    /** 한 블럭(range)당 페이지 수 **/
  private int curPage;			/** 현재 페이지 **/
  private int curRange;  		/** 현재 블럭(range) **/
  private int listCnt;			/** 총 게시글 수 **/
  private int totalPage;		/** 총 페이지 수 **/
  private int rangeCnt;			/** 총 블럭(range) 수 **/
  private int startPage;  		/** 시작 페이지 **/
  private int endPage;  		/** 끝 페이지 **/
  private int startIndex = 0;	/** 시작 index **/
  private int prevPage;  		/** 이전 페이지 **/
  private int nextPage;  		/** 다음 페이지 **/
  public Pagination() {}
  public Pagination(int listCnt, int curPage, int pageSzie){
          /**
           * 페이징 처리 순서
           * 1. 총 페이지수
           * 2. 총 블럭(range)수
           * 3. range setting
           */
          // 총 게시물 수와 현재 페이지, 한페이지당 게시글 수를 Controller로 부터 받아온다.
          /** 현재페이지 **/
          setCurPage(curPage);
          /** 총 게시물 수 **/
          setListCnt(listCnt);
          /** 한 페이지당 게시글 수 **/
          setPageSize(pageSzie);
          /** 한 블럭(range)당 페이지 수 **/
          setRangeSize(10);
          
          /** 1. 총 페이지 수 **/
          setPageCnt(listCnt);
          /** 2. 총 블럭(range)수 **/
          setRangeCnt(totalPage);
          /** 3. 블럭(range) setting **/
          rangeSetting(curPage);
          
          /** DB 질의를 위한 startIndex 설정 **/
          setStartIndex(curPage);
  }
  

  public void setPageCnt(int listCnt) {
      this.totalPage = (int) Math.ceil(listCnt*1.0/pageSize);
  }
  public void setRangeCnt(int totalPage) {
      this.rangeCnt = (int) Math.ceil(totalPage*1.0/rangeSize);
  }
  public void rangeSetting(int curPage){
      
      setCurRange(curPage);        
      this.startPage = (curRange - 1) * rangeSize + 1;
      this.endPage = startPage + rangeSize - 1;
      
      if(endPage > totalPage){
          this.endPage = totalPage;
      }
      
      this.prevPage = curPage - 1;
      this.nextPage = curPage + 1;
  }
  public void setCurRange(int curPage) {
      this.curRange = (int)((curPage-1)/rangeSize) + 1;
  }
  public void setStartIndex(int curPage) {
      this.startIndex = (curPage-1) * pageSize;
  }

  public int getPageSize() {
      return pageSize;
  }

  public void setPageSize(int pageSize) {
      this.pageSize = pageSize;
  }

  public int getRangeSize() {
      return rangeSize;
  }

  public void setRangeSize(int rangeSize) {
      this.rangeSize = rangeSize;
  }

  public int getCurPage() {
      return curPage;
  }

  public void setCurPage(int curPage) {
      this.curPage = curPage;
  }

  public int getCurRange() {
      return curRange;
  }

  public int getListCnt() {
      return listCnt;
  }

  public void setListCnt(int listCnt) {
      this.listCnt = listCnt;
  }

  public int getTotalPage() {
      return totalPage;
  }

  public void setTotalPage(int totalPage) {
      this.totalPage = totalPage;
  }

  public int getRangeCnt() {
      return rangeCnt;
  }

  public int getStartPage() {
      return startPage;
  }

  public void setStartPage(int startPage) {
      this.startPage = startPage;
  }

  public int getEndPage() {
      return endPage;
  }

  public void setEndPage(int endPage) {
      this.endPage = endPage;
  }

  public int getStartIndex() {
      return startIndex;
  }

  public int getPrevPage() {
      return prevPage;
  }

  public void setPrevPage(int prevPage) {
      this.prevPage = prevPage;
  }

  public int getNextPage() {
      return nextPage;
  }

  public void setNextPage(int nextPage) {
      this.nextPage = nextPage;
  }
  

  @Override
  public String toString() {
      return "Pagination [pageSize=" + pageSize + ", rangeSize=" + rangeSize + ", curPage=" + curPage + ", curRange="
              + curRange + ", listCnt=" + listCnt + ", totalPage=" + totalPage + ", rangeCnt=" + rangeCnt
              + ", startPage=" + startPage + ", endPage=" + endPage + ", startIndex=" + startIndex + ", prevPage="
              + prevPage + ", nextPage=" + nextPage + "]";
  }
  
  

}