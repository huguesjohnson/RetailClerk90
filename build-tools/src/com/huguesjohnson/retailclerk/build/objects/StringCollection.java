/*
BuildToolsForRetailClerk90

Copyright (c) 2019-2021 Hugues Johnson

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

package com.huguesjohnson.retailclerk.build.objects;

import java.io.Serializable;
import java.util.Map;

public class StringCollection implements Serializable{
	private static final long serialVersionUID=113969L;

	public String name; //name of the text set
	public String description=null; //longer description of the text set
	public String skipTable=null; //'true' = do not create a lookup table
	public int lineLength=22; //length before line feeds occur
	public int formLines=0; //how many lines before a form feed 
	public String defaultTerminator="ETX"; //how to end the final line of a text block
	public String defaultLineFeed="LF"; //default line feed character
	public String defaultFormFeed="FF"; //default form feed character
	public char defaultNextPageChar='^'; //default character to indicate there is another page of text
	public Map<String,TextLine> lines; //the actual lines of text
}