/*
CSVMemoryMap

Copyright(c) 2016-2019 Hugues Johnson

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
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public abstract class CSVMemoryMap{
	private static final String newLine=System.lineSeparator();

	public static void GenerateMemoryMap(String sourceFile,String destinationFile,String baseAddress){
		BufferedReader bufferedReader=null;
		OutputStreamWriter outputStreamWriter=null;
		int lineNumber=0;
		String currentLine=null;
		try{
			String currentAddressHex=baseAddress;
			long currentAddressInt=Long.valueOf(currentAddressHex,16);
			bufferedReader=new BufferedReader(new InputStreamReader(new FileInputStream(sourceFile)));
			outputStreamWriter=new FileWriter(destinationFile);
			outputStreamWriter.write("MEM_START=$"+baseAddress+newLine);
			String address=baseAddress;
			while((currentLine=bufferedReader.readLine())!=null){
				lineNumber++;
				StringBuffer stringBuffer=new StringBuffer();
				if(currentLine.startsWith(";")){
					stringBuffer.append(currentLine);
				}else{
					String[] split=currentLine.split(",");
					if(split.length!=3){
						throw new Exception("Invalid length in line "+lineNumber+" expected 3 actual "+split.length);
					}
					stringBuffer.append(split[0]);
					stringBuffer.append("=$");
					address=Long.toHexString(currentAddressInt).toUpperCase();
					stringBuffer.append(address);
					stringBuffer.append("\t; ");
					stringBuffer.append(split[2]);
					int size=Integer.parseInt(split[1]);
					currentAddressInt+=size;
				}
				stringBuffer.append(newLine);
				outputStreamWriter.write(stringBuffer.toString());
			}
			outputStreamWriter.write("MEM_END=$"+(Long.toHexString(currentAddressInt).toUpperCase())+newLine);
		}catch(Exception x){
			if(lineNumber>0){
				System.out.println("Error in line: "+lineNumber);
			}
			if(currentLine!=null){
				System.out.println("Current line: "+currentLine);
			}
			x.printStackTrace();
		}finally{
			try{
				if(bufferedReader!= null){bufferedReader.close();}
			}catch (Exception x){ }
			try{
				if(outputStreamWriter!=null){
					outputStreamWriter.flush();
					outputStreamWriter.close();
				}
			}catch (Exception x){ }
		}
	}
}
