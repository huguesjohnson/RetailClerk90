/*
PathResolver.java - Utility class to resolve full and absolute paths.
I wrote this on a whim in 2004, there's probably something built into JDK to do the same now.

Copyright (c) 2004-2019 Hugues Johnson

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
import java.lang.String;
import java.lang.StringBuffer;
import java.util.StringTokenizer;

public abstract class PathResolver{
	public final static String PARENT_PATH="..";
	public final static String SELF_PATH=".";

	/*
	 * Resolves an absolute path against another to get a relative path.<br>
	 * <b>Case insensitive</b><br>
	 * Examples of input/output combinations:
	 * <ul>
	 * <li>absolutePath1="c:\\folder1\\" absolutePath2="c:\\folder1\\sub-folder1\\" getRelativePath=".\\sub-folder1\\"</li>
	 * <li>absolutePath1="c:\\folder1\\" absolutePath2="c:\\folder1\\sub-folder1\\file.txt" getRelativePath=".\\sub-folder1\\file.txt"</li>
	 * <li>absolutePath1="c:\\folder1\\sub-folder1\\" absolutePath2="c:\\folder2\\" getRelativePath="..\\..\\folder2\\"</li>
	 * </ul>
	 * If the drives are different then an absolute path must be returned.<br>
	 * For example: absolutePath1="c:\\folder1\\" absolutePath2="d:\\folder2\\" getRelativePath="d:\\folder2\\" 
	 */
	public final static String getRelativePath(String absolutePath1,String absolutePath2){
		// verify input parameters
		if(absolutePath1==null){
			if(absolutePath2==null){
				return(null);
			}
			return(absolutePath2);
		} else if(absolutePath2==null){
			return(absolutePath1);
		}
		StringBuffer relativePath=new StringBuffer();
		StringTokenizer tokenizer1=new StringTokenizer(absolutePath1,File.separator);
		StringTokenizer tokenizer2=new StringTokenizer(absolutePath2,File.separator);
		// are there tokens?
		if(tokenizer1.hasMoreTokens()&&tokenizer2.hasMoreTokens()){
			// are the first tokens (drive letters) equal?
			String token1=tokenizer1.nextToken();
			String token2=tokenizer2.nextToken();
			if(token1.equals(token2)){
				int parentCount=0;
				boolean pathBroken=false;
				while(tokenizer1.hasMoreTokens()&&tokenizer2.hasMoreTokens()){
					token1=tokenizer1.nextToken();
					token2=tokenizer2.nextToken();
					if(!token1.equals(token2)||pathBroken){
						pathBroken=true;
						relativePath.append(File.separator);
						relativePath.append(token2);
						parentCount++;
					} else{

					}
				}
				// one or both are now out of tokens
				if(tokenizer1.hasMoreTokens()){
					parentCount+=tokenizer1.countTokens();
				} else if(tokenizer2.hasMoreTokens()){
					while(tokenizer2.hasMoreTokens()){
						relativePath.append(File.separator);
						relativePath.append(tokenizer2.nextToken());
					}
				}
				// now append parent paths or self path
				if(parentCount>0){
					for(int index=0;index<parentCount-1;index++){
						relativePath.insert(0,PARENT_PATH);
						relativePath.insert(0,File.separator);
					}
					relativePath.insert(0,PARENT_PATH);
				} else{
					relativePath.insert(0,SELF_PATH);
				}
				// add a path separator to the end of this
				if(absolutePath2.endsWith(File.separator)){
					relativePath.append(File.separator);
				}
			} else{ // need to return the absolute path
				return(absolutePath2);
			}
		}
		return(relativePath.toString());
	}

	/*
	 * Resolves an absolute path against a relative path to get an absolute path.<br>
	 * <b>Case insensitive</b><br>
	 * Examples of input/output combinations: 
	 * <ul>
	 * <li>absolutePath="c:\\folder1\\" relativePath=".\\sub-folder1\\" getAbsolutePath="c:\\folder1\\sub-folder1\\"</li>
	 * <li>absolutePath="c:\\folder1\\sub-folder1\\" relativePath="..\\..\\folder2\\" getAbsolutePath="c:\\folder2\\"</li>
	 * <li>absolutePath="c:\\folder1\\sub-folder1\\" relativePath="..\\..\\folder2\\file.txt" getAbsolutePath="c:\\folder2\\file.txt"</li>
	 * </ul>
	 */
	public final static String getAbsolutePath(String absolutePath,String relativePath){
		// verify input parameters
		if(absolutePath==null){
			if(relativePath==null){
				return(null);
			}
			return(relativePath);
		} else if(relativePath==null){
			return(absolutePath);
		}
		StringBuffer finalPath=new StringBuffer(absolutePath);
		StringTokenizer tokenizer=new StringTokenizer(relativePath,File.separator);
		while(tokenizer.hasMoreTokens()){
			String token=tokenizer.nextToken();
			if(token.equals(PARENT_PATH)){
				int lastIndex=finalPath.length()-1;
				int indexOf=finalPath.substring(0,lastIndex).lastIndexOf(File.separator);
				if(indexOf>0){
					finalPath.delete(indexOf,lastIndex);
				}
			} else if(!token.equals(SELF_PATH)){
				finalPath.append(token);
				finalPath.append(File.separator);
			}
		}
		// trim off File.separator if relativePath didn't end in one
		String returnPath=finalPath.toString();
		if(!relativePath.endsWith(File.separator)){
			if(returnPath.endsWith(File.separator)){
				returnPath=returnPath.substring(0,returnPath.length()-File.separator.length());
			}
		}
		return(returnPath);
	}
}