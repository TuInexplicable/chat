package service;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class Save {
	static public boolean save(String filename,String message) throws IOException {
		if(message=="");
		else {
		File file = new File("I:\\聊天纪录/"+filename+".properties");
		if(!file.exists()) {
			file.createNewFile();
		}else {
			FileWriter fw = new FileWriter(file,true);
			char[] bt = message.toCharArray();
			fw.write(bt);
			fw.flush();
			fw.close();
		/*	in.close();*/
			return true;
		}}
		return false;
	}

}
