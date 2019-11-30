/*
BuildToolsForRetailClerk90

Copyright (c) 2019 Hugues Johnson

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
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;

import javax.imageio.ImageIO;

import com.huguesjohnson.PathResolver;
import com.huguesjohnson.retailclerk.build.parameters.TilesetParameters;

public class BuildTiles{
	private final static String newLine=System.lineSeparator();

	public static void build(String basePath,TilesetParameters tiles){
		FileWriter includeWriter=null;
		FileWriter tileWriter=null;
		try{
			//setup include writer
			String includeFilePath=basePath+tiles.includeFilePath;
			includeWriter=new FileWriter(includeFilePath);
			//loop through all tilesets
			for(int i=0;i<tiles.tilesets.length;i++){
				//read colors from the palette
				ArrayList<String> colors=new ArrayList<String>();
				BufferedReader reader=null;
				reader=new BufferedReader(new FileReader(basePath+tiles.tilesets[i].palettePath));
				String currentLine;
				while((currentLine=reader.readLine())!=null){
					colors.add(ColorUtils.genesisRgbStringToHexString(currentLine));
				}
				reader.close();
				//setup the tilewriter
				String outputFilePath=basePath+tiles.tilesets[i].destinationFilePath;
				tileWriter=new FileWriter(outputFilePath);
				//read the source file
				String sourceFilePath=basePath+tiles.tilesets[i].sourceFilePath;
				File sourceFile=new File(sourceFilePath);
				BufferedImage image=ImageIO.read(sourceFile);
				//get & test image width
				int width=image.getWidth();
				if(width%8!=0){throw(new Exception("Image width must be a multiple of 8"));}
				//get & test image height
				int height=image.getHeight();
				if(height%8!=0){throw(new Exception("Image width must be a multiple of 8"));}
				ArrayList<Tile8x8> uniqueTiles=new ArrayList<Tile8x8>();
				//loop through all the pixels and filter out duplicate tiles
				int row=0;
				while(row<height){
					int col=0;
					while(col<width){
						Tile8x8 tile8x8=new Tile8x8();
						//loop through each pixel of the next 8x8 cell
						for(int x=col;x<(col+8);x++){
							for(int y=row;y<(row+8);y++){
								int color=image.getRGB(x,y);
								String hexString=Integer.toHexString(color);
								int index=ColorUtils.findNearestColor(colors,hexString);
								//yes, these are getting transposed on purpose
								tile8x8.pixels[y-row][x-col]=index;
							}
						}
						if(!uniqueTiles.contains(tile8x8)){
							uniqueTiles.add(tile8x8);
							String indexStr="\t; "+Integer.toHexString(uniqueTiles.size()-1).toUpperCase();
							tileWriter.write(indexStr);
							tileWriter.write(newLine);
							tileWriter.write(tile8x8.toAsmLines());
							tileWriter.write(newLine);
						}
						col+=8;
					}
					row+=8;
				}
				//update the include file
				String includePathRel=PathResolver.getRelativePath(includeFilePath,outputFilePath);
				if(includePathRel.startsWith("..")){
					includePathRel=includePathRel.substring(3);
				}
				StringBuffer includeString=new StringBuffer();
				includeString.append(tiles.tilesets[i].name);
				includeString.append("TilesStart:");
				includeString.append(newLine);
				includeString.append("\tinclude '");
				includeString.append(includePathRel);
				includeString.append("'");
				includeString.append(newLine);
				includeString.append(tiles.tilesets[i].name);
				includeString.append("TilesEnd:");
				includeString.append(newLine);
				includeString.append(newLine);
				includeWriter.write(includeString.toString());
				//close the tile writer
				tileWriter.flush();
				tileWriter.close();
			}
			
		}catch(Exception x){
			x.printStackTrace();
		}finally{
			try{if(includeWriter!=null){includeWriter.flush();includeWriter.close();}}catch(Exception x){ }
			try{if(tileWriter!=null){tileWriter.flush();tileWriter.close();}}catch(Exception x){ }
		}
	}
}
