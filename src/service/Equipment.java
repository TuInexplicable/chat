package service;

public class Equipment {
	static public String equipment(String userAgent) {
		String agent;
		if(userAgent.indexOf("Android") != -1){
		    //��׿
			agent = "Android";
		}else if(userAgent.indexOf("iPhone") != -1 || userAgent.indexOf("iPad") != -1){
		   //ƻ��
			agent = "mac";
		}else{
		    //����
			agent = "pc";
		}
		
		return agent;
	}
}
