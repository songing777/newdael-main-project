package com.vongether.common.util;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

//서비스명 : 검색어봉사참여정보목록조회
public class RestTest {
	
	public JsonArray ja;
	public static final String VOLUNTEERPARTCPTN_API_URL = "http://openapi.1365.go.kr/openapi/service/rest/VolunteerPartcptnService/getVltrSearchWordList";
	
	public RestTest(Map<String, String> param) throws IOException {
	  
	  StringBuilder queryUrl = new StringBuilder();
      String progrmBgnde = param.get("progrmBgnde"); //봉사시작일자 20121015
      String progrmEndde = param.get("progrmEndde"); //봉사종료일자
      String numOfRows = "9"; //한 페이지 결과 수
      String pageNo = param.get("pageNo"); //페이지 번호
      //String totalCount = param.get("totalCount"); //전체 결과 수
      String keyword = param.get("keyword"); //봉사 참여 제목
      String schCateGu = param.get("schCateGu"); //키필드 전체/내용/제목 all/progrmCn/prormSj
      String schSido = param.get("schSido"); //코드조회서비스-지역코드조회 결과값
      String schSign1 = param.get("schSign1"); //코드조회서비스-지역코드조회 결과값
      //String _type = param.get("json"); //결과 값 타입 지정
      
      queryUrl.append(VOLUNTEERPARTCPTN_API_URL);
      queryUrl.append("?progrmBgnde=" + URLEncoder.encode(progrmBgnde.replaceAll(" ", ""), "UTF-8"));
      queryUrl.append("&progrmEndde=" + URLEncoder.encode(progrmEndde.replaceAll(" ", ""), "UTF-8"));
      queryUrl.append("&numOfRows=" + URLEncoder.encode(numOfRows.replaceAll(" ", ""), "UTF-8"));
      queryUrl.append("&pageNo=" + URLEncoder.encode(pageNo.replaceAll(" ", ""), "UTF-8"));
      //queryUrl.append("&totalCount=" + URLEncoder.encode(totalCount.replaceAll(" ", ""), "UTF-8"));
      queryUrl.append("&keyword=" + URLEncoder.encode(keyword.replaceAll(" ", ""), "UTF-8"));
      queryUrl.append("&schCateGu=" + URLEncoder.encode(schCateGu.replaceAll(" ", ""), "UTF-8"));
      queryUrl.append("&schSido=" + URLEncoder.encode(schSido.replaceAll(" ", ""), "UTF-8"));
      queryUrl.append("&schSign1=" + URLEncoder.encode(schSign1.replaceAll(" ", ""), "UTF-8"));
      queryUrl.append("&_type=" + URLEncoder.encode("json", "UTF-8"));

      
        URL url = new URL(queryUrl.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        JsonObject jo = new JsonObject();
        ja = new JsonArray();
        JsonParser parser = new JsonParser();
        jo = (JsonObject) parser.parse(sb.toString());
        jo = jo.getAsJsonObject("response");
        jo = jo.getAsJsonObject("body");
        
        JsonObject joTotal = new JsonObject();
        int totalCount = jo.get("totalCount").getAsInt();
        joTotal.addProperty("totalCount", totalCount);
        //joTotal.addProperty("totalCount", numOfRows);
        
        if(totalCount == 1) {
        	jo = jo.getAsJsonObject("items");
        	jo = jo.getAsJsonObject("item");
        	ja.add(joTotal);
        	ja.add(jo);
        }else {
        	jo = jo.getAsJsonObject("items");
        	ja.add(joTotal.getAsJsonObject());
        	ja.addAll(jo.getAsJsonArray("item"));
        }
        
        rd.close();
        conn.disconnect();
	}


}
