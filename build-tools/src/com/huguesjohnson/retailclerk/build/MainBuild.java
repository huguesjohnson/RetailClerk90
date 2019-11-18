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

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Paths;

import com.google.gson.Gson;
import com.huguesjohnson.PathResolver;

public class MainBuild{

	public static void main(String[] args){
		try{
			if((args==null)||(args.length==0)){
				throw(new Exception("No build file specified, how about you try including one."));
			}
			/* ***********************************************************
			* Open the build file
			*********************************************************** */
			String json=Files.readString(Paths.get(args[0]));
			BuildInstructions instructions=(new Gson()).fromJson(json,BuildInstructions.class);
			
			/* ***********************************************************
			* Sort out the base path
			*********************************************************** */
			String basePath=instructions.basePath;
			if(basePath.startsWith(".")){
				String localPath=System.getProperty("user.dir");
				if(!localPath.endsWith(File.separator)){
					localPath=localPath+File.separator;
				}
				basePath=PathResolver.getAbsolutePath(localPath,basePath);
				if(!basePath.endsWith(File.separator)){
					basePath=basePath+File.separator;
				}
			}
			
			/* ***********************************************************
			* Build memory map
			*********************************************************** */
			CSVMemoryMap.generateMemoryMap(
					basePath+instructions.memoryMap.sourceFile,
					basePath+instructions.memoryMap.destinationFile,
					instructions.memoryMap.baseAddress);
			
			/* ***********************************************************
			* Build collision data
			*********************************************************** */
			BMPtoCollisionData.generateCollisionData(
					basePath,
					instructions.collision.collisionMap,
					instructions.collision.includeFilePath);
			
			/* ***********************************************************
			* Build palettes
			*********************************************************** */
			ExtractPalette.extract(
					basePath,
					instructions.palettes.paletteMap,
					instructions.palettes.includeFilePath);
			
			/* ***********************************************************
			* Build tiles
			*********************************************************** */
			BuildTiles.build(basePath,instructions.tiles);
			
			/* ***********************************************************
			* Build sprites
			*********************************************************** */
			BuildSprites.build(basePath,instructions.sprites);
			
			/* ***********************************************************
			* Generate header
			*********************************************************** */
			GenerateHeader.write(basePath,instructions.header);
			
			/* ***********************************************************
			* Compile
			*********************************************************** */
			for(int i=0;i<instructions.assembly.length;i++){
				ProcessBuilder pb=new ProcessBuilder(new String[]{"sh","-c",instructions.assembly[i].arguments});
				pb.directory(new File(basePath+instructions.assembly[i].assemblerPath));
				Process p=pb.start();
				p.waitFor();
				BufferedReader sErr=new BufferedReader(new InputStreamReader(p.getErrorStream()));
				String line=null;
				while((line=sErr.readLine())!=null){System.out.println(line);}
			}
			System.out.println("Build finished, have a nice day or whatever.");
		}catch(Exception x){
			System.out.println("Build error: "+x.getMessage());
			x.printStackTrace();
		}
	}
}