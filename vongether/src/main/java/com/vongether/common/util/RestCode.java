package com.vongether.common.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class RestCode {
	public JsonArray ja;
	
	public RestCode(String schSido) throws IOException {
		 StringBuilder urlBuilder = new StringBuilder("http://openapi.1365.go.kr/openapi/service/rest/CodeInquiryService/getAreaCodeInquiryList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=서비스키"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("schSido","UTF-8") + "=" + URLEncoder.encode(schSido, "UTF-8")); /**/
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /**/
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
	        
	        JsonObject jo = new JsonObject();
	        JsonParser parser = new JsonParser();
	        jo = (JsonObject) parser.parse(sb.toString());
	        jo = jo.getAsJsonObject("response");
	        jo = jo.getAsJsonObject("body");
	        
	        if(jo.get("totalCount").getAsInt() == 1) {
	        	jo = jo.getAsJsonObject("items");
	        	jo = jo.getAsJsonObject("item");
	        	ja = new JsonArray();
	        	ja.add(jo);
	        }else {
	        	jo = jo.getAsJsonObject("items");
	        	ja = jo.getAsJsonArray("item");
	        }
	        
	        rd.close();
	        conn.disconnect();
	}
}
