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

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import com.google.gson.Gson;
import com.huguesjohnson.PathResolver;
import com.huguesjohnson.ZipUtil;
import com.huguesjohnson.retailclerk.build.objects.PaletteMap;
import com.huguesjohnson.retailclerk.build.objects.Scene;
import com.huguesjohnson.retailclerk.build.objects.Tileset;

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
				String localPath=null;
				int index=args[0].lastIndexOf(File.separator);
				if(index<0){//same directory application is running out of
					localPath=System.getProperty("user.dir");
				}else{
					localPath=args[0].substring(0,index);
				}
				if(!localPath.endsWith(File.separator)){
					localPath=localPath+File.separator;
				}
				basePath=PathResolver.getAbsolutePath(localPath,basePath);
				if(!basePath.endsWith(File.separator)){
					basePath=basePath+File.separator;
				}
			}

			/* ***********************************************************
			* Backup
			*********************************************************** */
			if((instructions.backupPath!=null)&&(instructions.backupPath.length()>0)){
				String fullBackupPath=PathResolver.getAbsolutePath(basePath,instructions.backupPath);
				if(!fullBackupPath.endsWith(File.separator)){
					fullBackupPath=fullBackupPath+File.separator;
				}
				File f=(new File(fullBackupPath));
				boolean backupPathExists=f.exists();
				if(!backupPathExists){
					try{
						backupPathExists=f.mkdirs();
						System.out.println(fullBackupPath+" didn't exist but now does.");
					}catch(Exception x){
						System.out.println(fullBackupPath+" doesn't exist and can't be created");
						x.printStackTrace();
					}
				}
				if(backupPathExists){
					int index=basePath.lastIndexOf(File.separator,basePath.length()-2)+1;
					String name=basePath.substring(index,basePath.length()-1);
					Calendar calendar=Calendar.getInstance();
					Date now=calendar.getTime();
					DateFormat format=new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss-SSS");
					name=name+"_"+format.format(now)+".tar.gz";
					String command="tar --exclude='"+name+"' "+" --exclude='*.git' -zcvf "+name+" "+".";
					ProcessBuilder pb=new ProcessBuilder(new String[]{"sh","-c",command});
					pb.directory(new File(basePath));
					Process p=pb.start();
					p.waitFor();
					BufferedReader sErr=new BufferedReader(new InputStreamReader(p.getErrorStream()));
					String line=null;
					while((line=sErr.readLine())!=null){System.out.println(line);}
					command="mv -v '"+name+"' '"+fullBackupPath+"'";
					pb=new ProcessBuilder(new String[]{"sh","-c",command});
					pb.directory(new File(basePath));
					p=pb.start();
					p.waitFor();
					sErr=new BufferedReader(new InputStreamReader(p.getErrorStream()));
					line=null;
					while((line=sErr.readLine())!=null){System.out.println(line);}
				}
			}else{
				System.out.println("backupPath not defined, skipping task.");
			}
			
			/* ***********************************************************
			* Build memory map
			*********************************************************** */
			if(instructions.memoryMap!=null){
				CSVMemoryMap.generateMemoryMap(
						basePath+instructions.memoryMap.sourceFile,
						basePath+instructions.memoryMap.destinationFile,
						instructions.memoryMap.baseAddress);
			}else{
				System.out.println("memoryMap not defined, skipping task.");
			}

			/* ***********************************************************
			* Build constants
			*********************************************************** */
			if(instructions.constants!=null){
				BuildConstants.build(
						basePath,
						instructions.constants);
			}else{
				System.out.println("constants not defined, skipping task.");
			}
			
			/* ***********************************************************
			* Build collision data
			*********************************************************** */
			if(instructions.collision!=null){
				BMPtoCollisionData.generateCollisionData(
						basePath,
						instructions.collision.collisionMap,
						instructions.collision.includeFilePath);
			}else{
				System.out.println("collision not defined, skipping task.");
			}
			
			/* ***********************************************************
			* Build palettes
			*********************************************************** */
			HashMap<String,PaletteMap> paletteMap=new HashMap<String,PaletteMap>();
			if(instructions.palettes!=null){
				paletteMap=ExtractPalette.extract(
						basePath,
						instructions.palettes.paletteMap,
						instructions.palettes.includeFilePath);
			}else{
				System.out.println("palettes not defined, skipping task.");
			}
			
			/* ***********************************************************
			* Build tiles
			*********************************************************** */
			HashMap<String,Tileset> tileMap=new HashMap<String,Tileset>();
			if(instructions.tiles!=null){
				tileMap=BuildTiles.build(basePath,instructions.tiles,paletteMap);
			}else{
				System.out.println("tiles not defined, skipping task.");
			}
			
			/* ***********************************************************
			* Build sprites
			*********************************************************** */
			if(instructions.sprites!=null){
				BuildSprites.build(basePath,instructions.sprites,paletteMap);
			}else{
				System.out.println("sprites not defined, skipping task.");
			}
			
			/* ***********************************************************
			* Build scenes
			*********************************************************** */
			if(instructions.scenes!=null){
				int length=instructions.scenes.scenePaths.length;
				Scene[] scenes=new Scene[length];
				for(int i=0;i<length;i++){
					String sceneJson=Files.readString(Paths.get(basePath+instructions.scenes.scenePaths[i]));
					scenes[i]=(new Gson()).fromJson(sceneJson,Scene.class);
				}
				BuildScenes.build(basePath,basePath+instructions.scenes.includeFilePath,instructions.scenes.lookupTablePath,scenes,tileMap);
			}else{
				System.out.println("scenes not defined, skipping task.");
			}
			
			/* ***********************************************************
			* Build text
			*********************************************************** */
			if(instructions.text!=null){
				BuildText.build(basePath,instructions.text);
			}else{
				System.out.println("text not defined, skipping task.");
			}
			
			/* ***********************************************************
			* Generate header
			*********************************************************** */
			if(instructions.header!=null){
				GenerateHeader.write(basePath,instructions.header);
			}else{
				System.out.println("header not defined, skipping task.");
			}
			
			/* ***********************************************************
			* Compile
			*********************************************************** */
			if(instructions.assembly!=null){
				for(int i=0;i<instructions.assembly.length;i++){
					ProcessBuilder pb=new ProcessBuilder(new String[]{"sh","-c",instructions.assembly[i].arguments});
					pb.directory(new File(basePath+instructions.assembly[i].assemblerPath));
					Process p=pb.start();
					p.waitFor();
					BufferedReader sErr=new BufferedReader(new InputStreamReader(p.getErrorStream()));
					String line=null;
					while((line=sErr.readLine())!=null){System.out.println(line);}
				}
			}else{
				System.out.println("assembly not defined, skipping task.");
			}

			/* ***********************************************************
			* Package
			*********************************************************** */
			if(instructions.packageParameters!=null){
				for(int i=0;i<instructions.packageParameters.length;i++){
					ZipUtil.zip(
							basePath,
							instructions.packageParameters[i].includeFilePaths,
							instructions.packageParameters[i].packagePath);
				}
			}else{
				System.out.println("package not defined, skipping task.");
			}
			
			System.out.println("Build finished, have a nice day or whatever.");
		}catch(Exception x){
			System.out.println("Build error: "+x.getMessage());
			x.printStackTrace();
		}
	}
}