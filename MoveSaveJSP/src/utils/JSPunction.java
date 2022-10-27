package utils;

import javax.servlet.jsp.JspWriter;

public class JSPunction {
	
	public static void alertLocation(String msg, String url, JspWriter out) {
		
		try {
		String script = "" 
				+ "<script>" 
				+ "   alert('" + msg + "');" 
				+ "   location.href'"+ url + ";" 
				+ "</script>";
		out.println(script);
		} catch (Exception e) {}
		
	}	
}
