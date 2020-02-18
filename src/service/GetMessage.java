package service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;

public class GetMessage {
	static public String getMessage(String filename) throws IOException {
		File file = new File("I:\\聊天纪录/"+filename+".properties");
		String tips="" ;
		if(!file.exists()) {
			tips = "无记录";
		}else {
			FileWriter fw = new FileWriter(file,true);
			FileInputStream in =new FileInputStream(file);
			int n = 0;
			byte[] bt = new byte[1024];
			while((n=in.read(bt))!=-1) {
				String temp = new String(bt,0,n);
				tips+=temp;
			}
			fw.flush();
			fw.close();
			in.close();
			
		}
		return tips;
		}
}
