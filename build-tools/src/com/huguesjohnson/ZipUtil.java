/*
ZipUtils.java - Utility class with some zip functions
Largely copied from my Debigulator project

Copyright (c) 2003-2020 Hugues Johnson

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

package com.huguesjohnson;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.zip.CRC32;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class ZipUtil{
    final static int BUFFER_LENGTH=1024;

    public static boolean zip(String basePath,String[] includeFilePaths,String archiveFileName) throws Exception{
        boolean success=false;
        ZipOutputStream zout=null;
        FileInputStream fin=null;
        try{
        	zout=new ZipOutputStream(new FileOutputStream(new File(basePath+archiveFileName)));
            zout.setMethod(ZipOutputStream.DEFLATED);
            for(int i=0;i<includeFilePaths.length;i++){
            	String sourceFileName=basePath+includeFilePaths[i];
	            File inputFile=new File(sourceFileName);
	            byte buffer[]=new byte[BUFFER_LENGTH];
	            /* generate CRC */
	            CRC32 crc=new CRC32();
	            fin=new FileInputStream(inputFile);
	            int availableBytes=fin.available();
	            int length;
	            int bytesRead=0;
	            int lastPercentComplete=-1;
	            while((length=fin.read(buffer))>-1){
	                crc.update(buffer,0,length);
	            }
	            fin.close();
	            //create zip entry
	            ZipEntry entry=new ZipEntry(sourceFileName.substring(sourceFileName.lastIndexOf(File.separator)+File.separator.length()));
	            entry.setSize(inputFile.length());
	            entry.setTime(inputFile.lastModified());
	            entry.setCrc(crc.getValue());
	            zout.putNextEntry(entry);
	            fin=new FileInputStream(inputFile);
	            /* write entry to zip file */
	            while((length=fin.read(buffer))>-1){
	                zout.write(buffer,0,length);
	            }
            }
            success=true;
        }catch(Exception x){
            throw(x);
        }finally{
            try{if(zout!=null){zout.closeEntry();zout.close();}}catch(Exception x){}
            try{if(fin!=null){fin.close();}}catch(Exception x){}
        } 
        return(success);
    }	
	
}
