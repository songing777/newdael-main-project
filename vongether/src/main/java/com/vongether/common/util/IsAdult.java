package com.vongether.common.util;

import java.sql.Date;
import java.util.Calendar;

public class IsAdult {
	
	public static boolean gap(Date d) {
		Calendar c = Calendar.getInstance();
		Calendar c1 = Calendar.getInstance();
		c1.setTime(d);
		int result = c.get(Calendar.YEAR)-c1.get(Calendar.YEAR);
		//System.out.println(result);
		return result > 18 ? true : false; 
	}
}
