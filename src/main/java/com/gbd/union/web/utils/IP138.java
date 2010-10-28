package com.gbd.union.web.utils;

public class IP138 {

	final static String IP138="http://www.ip138.com:8080/search.asp?action=mobile&mobile=%s";
	final static String START_TAG="卡号归属地</TD><TD width=* align=\"center\" class=tdc2>";
	final static String END_TAG="</TD>";
	final static String DELIMITER="&nbsp;";
	

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	
	public static String[] getProvinceAndCity(String mobile)
	{
		//TODO: 完成IP138号段查询
		return IP138.split("DELIMITER");
	}
	
	
}
