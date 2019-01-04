package com.bit.test.map;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
//서비스명 : 검색어봉사참여정보목록조회
public class RestTest {
	public static void main(String[] args) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://openapi.1365.go.kr/openapi/service/rest/VolunteerPartcptnService/getVltrSearchWordList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=서비스키"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("progrmBgnde","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*봉사시작일자20121015*/
        urlBuilder.append("&" + URLEncoder.encode("progrmEndde","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*봉사종료일자*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("totalCount","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*전체 결과 수 */
        urlBuilder.append("&" + URLEncoder.encode("Keyword","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*봉사참여 제목*/
        urlBuilder.append("&" + URLEncoder.encode("schCateGu","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*전체/내용/제목 all/progrmCn/prormSj*/
        urlBuilder.append("&" + URLEncoder.encode("schSido","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*코드조회서비스-지역코드조회 결과값*/
        urlBuilder.append("&" + URLEncoder.encode("schSign1","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*코드조회서비스-지역코드조회 결과값*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
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
        rd.close();
        conn.disconnect();
        
        
        
        System.out.println(sb.toString());
    }
}
