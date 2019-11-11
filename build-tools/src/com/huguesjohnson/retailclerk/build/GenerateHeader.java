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

import java.io.FileWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.huguesjohnson.retailclerk.build.parameters.HeaderParameters;

public abstract class GenerateHeader{
	private final static String newLine=System.lineSeparator();

	public static void write(String basePath,HeaderParameters header){
		FileWriter headerWriter=null;
		try{
			//Java is like 20 years older than VB6 now yet VB6 is still 1000x better at working with dates
			Calendar calendar=Calendar.getInstance();
			Date now=calendar.getTime();
			DateFormat yearFormat=new SimpleDateFormat("yyyy");
			String year=yearFormat.format(now);
			DateFormat versionFormat=new SimpleDateFormat("yyyyMMdd-HH");
			String version=versionFormat.format(now);
			//create writer
			headerWriter=new FileWriter(basePath+header.filePath);
			//console name
			headerWriter.write("\tdc.b\t'SEGA GENESIS    '\t; console name");
			headerWriter.write(newLine);
			//copyright
			headerWriter.write("\tdc.b\t");
			headerWriter.write(header.copyright);
			headerWriter.write("\t; copyright");
			headerWriter.write(newLine);
			//date
			headerWriter.write("\tdc.b\t'");
			headerWriter.write(year);
			//really? this is the "best" way to get the current month?
			headerWriter.write(getMonthString(Calendar.getInstance().get(Calendar.MONTH)));
			headerWriter.write("'\t; date");
			headerWriter.write(newLine);
			//cart name
			headerWriter.write("\tdc.b\t");
			headerWriter.write(header.cartName);
			headerWriter.write("\t; cart name");
			headerWriter.write(newLine);
			//cart name - alt
			headerWriter.write("\tdc.b\t");
			headerWriter.write(header.cartName);
			headerWriter.write("\t; cart name (alt)");
			headerWriter.write(newLine);
			//program type / serial number / version
			headerWriter.write("\tdc.b\t'GM ");
			headerWriter.write(version);
			headerWriter.write("'\t; program type / serial number / version");
			headerWriter.write(newLine);
			//checksum
			headerWriter.write("\tdc.w\t$0000\t; ROM checksum");
			headerWriter.write(newLine);
			//I/O device support
			headerWriter.write("\tdc.b\t'J               '\t; I/O device support (unused)");
			headerWriter.write(newLine);
			//ROM start
			headerWriter.write("\tdc.l\t");
			headerWriter.write(header.romStart);
			headerWriter.write("\t; address of ROM start");
			headerWriter.write(newLine);
			//ROM end
			headerWriter.write("\tdc.l\t");
			headerWriter.write(header.romEnd);
			headerWriter.write("\t; address of ROM end");
			headerWriter.write(newLine);
			//RAM start/end
			headerWriter.write("\tdc.l\t");
			headerWriter.write(header.ramStartEnd);
			headerWriter.write("\t; RAM start/end");
			headerWriter.write(newLine);
			//sram type
			headerWriter.write("\tdc.b\t");
			headerWriter.write(header.sramType);
			headerWriter.write("\t; SRAM type");
			headerWriter.write(newLine);
			//sram start
			headerWriter.write("\tdc.l\t");
			headerWriter.write(header.sramStart);
			headerWriter.write("\t; SRAM start address");
			headerWriter.write(newLine);
			//sram end
			headerWriter.write("\tdc.l\t");
			headerWriter.write(header.sramEnd);
			headerWriter.write("\t; SRAM endaddress");
			headerWriter.write(newLine);
			//modem
			headerWriter.write("\tdc.b\t'            '\t; modem info");
			headerWriter.write(newLine);
			//comment
			headerWriter.write("\tdc.b\t");
			headerWriter.write(header.comment);
			headerWriter.write("\t; comment");
			headerWriter.write(newLine);
			//regions
			headerWriter.write("\tdc.b\t'JUE             '\t; regions allowed");
		}catch(Exception x){
			x.printStackTrace();			
		}finally{
			try{if(headerWriter!=null){headerWriter.flush(); headerWriter.close();}}catch(Exception x){ }
		}
	} 
	
	private final static String getMonthString(int month){
		if(month==0){return(".JAN");}
		if(month==1){return(".FEB");}
		if(month==2){return(".MAR");}
		if(month==3){return(".APR");}
		if(month==4){return(".MAY");}
		if(month==5){return(".JUN");}
		if(month==6){return(".JUL");}
		if(month==7){return(".AUG");}
		if(month==8){return(".SEP");}
		if(month==9){return(".OCT");}
		if(month==10){return(".NOV");}
		return(".DEC");
	}
	
}