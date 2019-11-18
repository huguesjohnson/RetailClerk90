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

public class Tile8x8{
	private final static String newLine=System.lineSeparator();

	public int[][] pixels;
	
	public Tile8x8(){this.pixels=new int[8][8];}
	
	public String toAsmLines(){
		StringBuffer lines=new StringBuffer();
		for(int x=0;x<8;x++){
			lines.append("\tdc.l\t$");
			for(int y=0;y<8;y++){
				lines.append(Integer.toHexString(this.pixels[x][y]).toUpperCase());
			}
			lines.append(newLine);
		}
		return(lines.toString());
	}

	@Override
	public boolean equals(Object obj){
		try{
			Tile8x8 tobj=(Tile8x8)obj;
			for(int x=0;x<8;x++){
				for(int y=0;y<8;y++){
					if(this.pixels[x][y]!=tobj.pixels[x][y]){return(false);}
				}
			}
			return(true);
		}catch(Exception x){
			return(false);
		}
	}

	@Override
	public int hashCode(){
		int hash=0;
		for(int x=0;x<8;x++){
			int i=0;
			for(int y=0;y<8;y++){
				i+=this.pixels[x][y];
			}
			hash+=(x*10)+i;
		}
		return(hash);
	}

	@Override
	public String toString(){
		return(this.toAsmLines());
	}
}