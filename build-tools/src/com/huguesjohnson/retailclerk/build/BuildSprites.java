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
import com.huguesjohnson.retailclerk.build.parameters.SpriteParameters;

public abstract class BuildSprites{
	private final static String newLine=System.lineSeparator();
	
	public static void build(String basePath,SpriteParameters sprites){
		int id=Integer.parseInt(sprites.baseId,16);

		FileWriter includeWriter=null;
		FileWriter definitionWriter=null;
		FileWriter constantWriter=null;
		try{
			//setup include and definition writers
			String includeFilePath=basePath+sprites.includeFilePath;
			includeWriter=new FileWriter(includeFilePath);
			String definitionFilePath=basePath+sprites.characterDefinitionFilePath;
			definitionWriter=new FileWriter(definitionFilePath);
			definitionWriter.write("CharacterDefinitionStart:");
			definitionWriter.write(newLine);
			definitionWriter.write(newLine);
			String constantFilePath=basePath+sprites.constantDefinitionPath;
			constantWriter=new FileWriter(constantFilePath);
			constantWriter.write("OBJ_NPC_BASE=$"+sprites.baseId);
			constantWriter.write(newLine);
			//read colors from the palette
			ArrayList<String> colors=new ArrayList<String>();
			BufferedReader reader=null;
			reader=new BufferedReader(new FileReader(basePath+sprites.palettePath));
			String currentLine;
			while((currentLine=reader.readLine())!=null){
				colors.add(ColorUtils.genesisRgbStringToHexString(currentLine));
			}
			reader.close();
			//loop through all the sprites
			for(int i=0;i<sprites.sprites.length;i++){
				id++;	//increment id first
				String hexId=Integer.toHexString(id);
				String sourceFilePath=basePath+sprites.sprites[i].sourceFilePath;
				String outputFilePath=basePath+sprites.sprites[i].destinationFilePath;
				FileWriter tileWriter=new FileWriter(outputFilePath);
				//generate the tiles
				//open the image
				File sourceFile=new File(sourceFilePath);
				BufferedImage image=ImageIO.read(sourceFile);
				//get & test image width
				int width=image.getWidth();
				if(width%8!=0){throw(new Exception("Image width must be a multiple of 8"));}
				//get & test image height
				int height=image.getHeight();
				if(height%8!=0){throw(new Exception("Image width must be a multiple of 8"));}
				//setup variables used to track reading the image
				int totalFrames=12;
				int currentFrame=0;
				//loop through sprite sheet
				while(currentFrame<totalFrames){
					tileWriter.write(newLine);
					tileWriter.write(sprites.sprites[i].name+"_Frame"+currentFrame+"Start:");
					tileWriter.write(newLine);
					tileWriter.write(newLine);
					for(int col=0;col<=1;col++){
						for(int row=0;row<=3;row++){
							//loop through each pixel of the next 8x8 cell
							for(int y=0;y<8;y++){
								StringBuffer line=new StringBuffer();
								line.append("\tdc.l\t$");
								for(int x=0;x<8;x++){
									int pixelX=(col*8)+x;
									int pixelY=(row*8)+(currentFrame*32)+y;
									int color=image.getRGB(pixelX,pixelY); 
									String hexString=Integer.toHexString(color);
									int index=ColorUtils.findNearestColor(colors,hexString);
									line.append(Integer.toHexString(index).toUpperCase());
								}
								line.append(newLine);
								tileWriter.write(line.toString());
							}
							tileWriter.write(newLine);
						}
					}
					tileWriter.write(sprites.sprites[i].name+"_Frame"+currentFrame+"End:");
					tileWriter.write(newLine);
					currentFrame++;
				}
				
				
				
				tileWriter.flush();
				tileWriter.close();
				//update constants
				StringBuffer constLine=new StringBuffer("OBJ_NPC_");
				constLine.append(sprites.sprites[i].name.toUpperCase());
				constLine.append("=$");
				constLine.append(hexId);
				constLine.append(newLine);
				constantWriter.write(constLine.toString());
				//update include file
				String includePathRel=PathResolver.getRelativePath(includeFilePath,outputFilePath);
				if(includePathRel.startsWith("..")){
					includePathRel=includePathRel.substring(3);
				}
				StringBuffer includeString=new StringBuffer();
				String label=sprites.sprites[i].name+"SpriteTiles";
				includeString.append(label);
				includeString.append("Start:");
				includeString.append(newLine);
				includeString.append("\tinclude '");
				includeString.append(includePathRel);
				includeString.append("'");
				includeString.append(newLine);
				includeString.append(label);
				includeString.append("End:");
				includeString.append(newLine);
				includeString.append(newLine);
				includeWriter.write(includeString.toString());
				//update character definition
				StringBuffer line=new StringBuffer("; ");
				line.append(hexId);
				line.append(" - ");
				line.append(sprites.sprites[i].name);
				line.append(newLine);
				definitionWriter.write(line.toString());
				line=new StringBuffer("CharacterDefinition");
				line.append(sprites.sprites[i].name);
				line.append("Start:");
				line.append(newLine);
				definitionWriter.write(line.toString());
				line=new StringBuffer("\tdc.l\t");
				line.append(sprites.sprites[i].name);
				line.append("SpriteTilesStart");
				line.append(newLine);
				definitionWriter.write(line.toString());
				line=new StringBuffer("CharacterDefinition");
				line.append(sprites.sprites[i].name);
				line.append("End:");
				line.append(newLine);
				line.append(newLine);
				definitionWriter.write(line.toString());
			}
			definitionWriter.write("CharacterDefinitionEnd:");
			definitionWriter.write(newLine);
		}catch(Exception x){
			x.printStackTrace();
		}finally{
			try{if(includeWriter!=null){includeWriter.flush(); includeWriter.close();}}catch(Exception x){ }
			try{if(definitionWriter!=null){definitionWriter.flush(); definitionWriter.close();}}catch(Exception x){ }
			try{if(constantWriter!=null){constantWriter.flush(); constantWriter.close();}}catch(Exception x){ }
		}
	}
	
}