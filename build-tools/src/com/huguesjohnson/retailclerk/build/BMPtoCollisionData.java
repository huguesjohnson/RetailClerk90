/* 
Convert a BMP image to collision data

Code to read bmp pixels is from: http://stackoverflow.com/questions/17015340/how-to-read-a-bmp-file-identify-which-pixels-are-black-in-java (mmirwaldt response)

Everything else by Hugues Johnson

Since it's partially derived from a StackOverflow answer the entire contents of this file are licensed under cc by-sa 3.0 https://creativecommons.org/licenses/by-sa/3.0/.
*/
package com.huguesjohnson.retailclerk.build;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileWriter;
import java.util.Map;

import javax.imageio.ImageIO;

import com.huguesjohnson.PathResolver;

public abstract class BMPtoCollisionData{
	private final static String newLine=System.lineSeparator();

	public static void GenerateCollisionData(String basePath,Map<String,String> sourceDestinationMap,String includeFilePath){
		FileWriter collisionDataWriter=null;
		FileWriter includeDataWriter=null;
		try{
			includeFilePath=basePath+includeFilePath;
			includeDataWriter=new FileWriter(includeFilePath);
			for(Map.Entry<String,String> entry:sourceDestinationMap.entrySet()){
				String sourceFilePath=basePath+entry.getKey();
				String outputFilePath=basePath+entry.getValue();
				File sourceFile=new File(sourceFilePath);
				BufferedImage image=ImageIO.read(sourceFile);
				int width=image.getWidth();
				if(width%32!=0){throw(new Exception("Image width must be a multiple of 32"));}
				int height=image.getHeight();
				int rowCounter=0;
				int colCounter=0;
				collisionDataWriter=new FileWriter(outputFilePath);
				for(int y=0;y<height;y++){
					long longValue=0;
					int power=0;
					for(int x=0;x<width;x++){
						int color=image.getRGB(x,y);
						if (color!=Color.WHITE.getRGB()){
			                longValue+=Math.pow(2,power);
						}
						if(power==31){
							StringBuffer hexValue=new StringBuffer(Long.toHexString(longValue).toUpperCase());
							int pad=8-hexValue.length();
							for(int i=0;i<pad;i++){hexValue.insert(0,'0');}
							hexValue.insert(0,"\tdc.l\t$");
							hexValue.append("\t; ");
							hexValue.append("row[");
							hexValue.append(rowCounter);
							hexValue.append("] col[");
							hexValue.append(colCounter);
							hexValue.append("]");
							if(colCounter==0){
								colCounter++;
							}else{
								colCounter=0;
								rowCounter++;
							}
							hexValue.append(newLine);
							collisionDataWriter.write(hexValue.toString());
							longValue=0;
							power=0;
						}else{
							power++;
						}
					}
				}
				collisionDataWriter.flush();
				collisionDataWriter.close();
				//update the include file
				String includePathRel=PathResolver.getRelativePath(includeFilePath,outputFilePath);
				if(includePathRel.startsWith("..")){
					includePathRel=includePathRel.substring(3);
				}
				StringBuffer includeString=new StringBuffer();
				includeString.append(includePathRel.substring(includePathRel.lastIndexOf(File.separator)+1,includePathRel.lastIndexOf('.')));
				includeString.append(":");
				includeString.append(newLine);
				includeString.append("\tinclude '");
				includeString.append(includePathRel);
				includeString.append("'");
				includeString.append(newLine);
				includeString.append(newLine);
				includeDataWriter.write(includeString.toString());
		    }
			includeDataWriter.flush();
			includeDataWriter.close();
		}catch(Exception x){
			x.printStackTrace();			
		}finally{
			try{if(collisionDataWriter!=null){collisionDataWriter.flush(); collisionDataWriter.close();}}catch(Exception x){ }
			try{if(includeDataWriter!=null){includeDataWriter.flush(); includeDataWriter.close();}}catch(Exception x){ }
		}
	}
}