/*
BuildToolsForRetailClerk90

Copyright (c) 2019-2020 Hugues Johnson

Permission is hereby granted, free of charge, to any person obtaining a copy of 
this software and associated documentation files(the "Software"), to deal in 
the Software without restriction, including without limitation the rights to 
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
of the Software, and to permit persons to whom the Software is furnished to do 
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all 
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
THE SOFTWARE.
*/
package com.huguesjohnson.retailclerk.build;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.imageio.IIOException;
import javax.imageio.ImageIO;

import com.huguesjohnson.PathResolver;
import com.huguesjohnson.retailclerk.build.parameters.PaletteMapDefinition;

public abstract class ExtractPalette{
	private final static String newLine=System.lineSeparator();

	public static void extract(String basePath,PaletteMapDefinition[] paletteMap,String includeFilePath){
		FileWriter paletteWriter=null;
		FileWriter includeWriter=null;
		String sourceFilePath=null;
		String outputFilePath=null;
		try{
			includeFilePath=basePath+includeFilePath;
			includeWriter=new FileWriter(includeFilePath);
			for(PaletteMapDefinition entry:paletteMap){
				sourceFilePath=basePath+entry.sourceFilePath;
				outputFilePath=basePath+entry.destinationFilePath;
				paletteWriter=new FileWriter(outputFilePath);
				File sourceFile=new File(sourceFilePath);
				BufferedImage image=ImageIO.read(sourceFile);
				int width=image.getWidth();
				int height=image.getHeight();
				ArrayList<String> colors=new ArrayList<String>();
				for(int row=0;row<height;row++){
					for(int col=0;col<width;col++){
						int color=image.getRGB(col,row); 
						String hexString=Integer.toHexString(color);
						String genesisRGBStr=ColorUtils.rgbStringToGenesisRgbString(hexString);
						int index=colors.indexOf(genesisRGBStr);
						if(index<0){
							colors.add(genesisRGBStr);
							if(colors.size()>16){
								throw(new Exception("More than 16 colors found in: "+entry.sourceFilePath));
							}else{
								StringBuffer line=new StringBuffer();
								line.append("\tdc.w\t%");
								line.append(genesisRGBStr);
								line.append(" ; ~");
								line.append(hexString);
								line.append(newLine);
								paletteWriter.write(line.toString());
							}
						}
					}
				}
				int size=colors.size();
				if(size<16){
					for(int i=size;i<16;i++){
						paletteWriter.write("\tdc.w\t%0000000000000000");
						paletteWriter.write(newLine);
					}
				}
				paletteWriter.flush();
				paletteWriter.close();
				//update the include file
				if((entry.exclude==null)||(!entry.exclude.equalsIgnoreCase("true"))){
					String includePathRel=PathResolver.getRelativePath(includeFilePath,outputFilePath);
					if(includePathRel.startsWith("..")){
						includePathRel=includePathRel.substring(3);
					}
					StringBuffer includeString=new StringBuffer();
					String label="Palette"+includePathRel.substring(includePathRel.lastIndexOf(File.separator)+1,includePathRel.lastIndexOf('.'));
					includeString.append(label);
					includeString.append(":");
					includeString.append(newLine);
					includeString.append("\tinclude '");
					includeString.append(includePathRel);
					includeString.append("'");
					includeString.append(newLine);
					includeString.append(newLine);
					includeWriter.write(includeString.toString());
				}
		    }
			includeWriter.flush();
			includeWriter.close();
		}catch(IIOException iiox){
			iiox.printStackTrace();
			System.err.println("sourceFilePath="+sourceFilePath);
			System.err.println("outputFilePath="+outputFilePath);
		}catch(Exception x){
			x.printStackTrace();			
		}finally{
			try{if(paletteWriter!=null){paletteWriter.flush(); paletteWriter.close();}}catch(Exception x){ }
			try{if(includeWriter!=null){includeWriter.flush(); includeWriter.close();}}catch(Exception x){ }
		}		
	}
}