package com.vongether.common.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONObject;
import org.json.XML;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class RestDetail {

	public JsonObject jo;
	
	
	public RestDetail(String num) throws IOException {
		 StringBuilder urlBuilder = new StringBuilder("http://openapi.1365.go.kr/openapi/service/rest/VolunteerPartcptnService/getVltrPartcptnItem"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=서비스키"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("progrmRegistNo","UTF-8") + "=" + URLEncoder.encode(num, "UTF-8")); /*프로그램등록번호*/
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*프로그램등록번호*/
	        URL url = new URL(urlBuilder.toString());
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
	        
	        
	        jo = new JsonObject();
	        JsonParser parser = new JsonParser();
	        jo = (JsonObject) parser.parse(sb.toString());
	        jo = jo.getAsJsonObject("response");
	        jo = jo.getAsJsonObject("body");
	        jo = jo.getAsJsonObject("items");
	        jo = jo.getAsJsonObject("item");
	        //System.out.println(jo);
	        
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	}


}
