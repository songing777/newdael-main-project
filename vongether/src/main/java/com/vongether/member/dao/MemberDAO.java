package com.vongether.member.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.vongether.board.model.BoardVO;
import com.vongether.member.model.MemberVO;
import com.vongether.volunteer.model.VolunteerAppVo;

public interface MemberDAO {

  Boolean insert(MemberVO memberVO) throws Exception;

  int checkId(String mId) throws Exception;

  MemberVO selectOne(Map<String, Object> param) throws Exception;
  
  int checkPwd(Map<String, Object> param) throws Exception;

  MemberVO selectOneSearch(String param) throws Exception;
  
  Boolean createAuthKey(@Param("mId")String mId, @Param("mAuthCode")String mAuthCode) throws Exception;
  
  void userAuth(String mId) throws Exception;
  
  Boolean update(MemberVO memberVO) throws Exception;
  
  String findId(Map<String, Object> param) throws Exception;
  
  String findPwd(Map<String, Object> param) throws Exception;
  
  Boolean newPwd(Map<String, Object> param) throws Exception;
  
  Boolean singOut(Map<String, Object> param) throws Exception;
  
  List<VolunteerAppVo> selectOneVList(String param) throws Exception;
  
  List<BoardVO> myBoardList(String mId) throws Exception;
}
