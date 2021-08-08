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

import com.huguesjohnson.retailclerk.build.parameters.AssemblyParameters;
import com.huguesjohnson.retailclerk.build.parameters.CollisionDataParameters;
import com.huguesjohnson.retailclerk.build.parameters.ConstantFileParameters;
import com.huguesjohnson.retailclerk.build.parameters.HeaderParameters;
import com.huguesjohnson.retailclerk.build.parameters.MemoryMapParameters;
import com.huguesjohnson.retailclerk.build.parameters.SimpleSourceDestinationParameters;
import com.huguesjohnson.retailclerk.build.parameters.PackageParameters;
import com.huguesjohnson.retailclerk.build.parameters.PaletteParameters;
import com.huguesjohnson.retailclerk.build.parameters.SceneParameters;
import com.huguesjohnson.retailclerk.build.parameters.SpriteParameters;
import com.huguesjohnson.retailclerk.build.parameters.TextParameters;
import com.huguesjohnson.retailclerk.build.parameters.TilesetParameters;

public class BuildInstructions implements Serializable{
	private static final long serialVersionUID=666L;

	/* ***********************************************************
	* Base path
	*********************************************************** */
	public String basePath;

	/* ***********************************************************
	* Backup path
	*********************************************************** */
	public String backupPath;

	/* ***********************************************************
	* Memory map
	*********************************************************** */
	public MemoryMapParameters memoryMap;

	/* ***********************************************************
	* Constants
	*********************************************************** */
	public ConstantFileParameters constants;
	
	/* ***********************************************************
	* Collision data
	*********************************************************** */
	public CollisionDataParameters collision;
	
	/* ***********************************************************
	* Palettes
	*********************************************************** */
	public PaletteParameters palettes;
	
	/* ***********************************************************
	* Tiles
	*********************************************************** */
	public TilesetParameters tiles;
	
	/* ***********************************************************
	* Sprite definitions
	*********************************************************** */
	public SpriteParameters sprites;
	
	/* ***********************************************************
	* Scene definitions
	*********************************************************** */
	public SceneParameters scenes;

	/* ***********************************************************
	* Text
	*********************************************************** */
	public TextParameters text;

	/* ***********************************************************
	* Scripted events
	*********************************************************** */
	public SimpleSourceDestinationParameters scriptedEvents;
	
	/* ***********************************************************
	* Movement patterns
	*********************************************************** */
	public SimpleSourceDestinationParameters movementPatterns;
	
	/* ***********************************************************
	* Header
	*********************************************************** */
	public HeaderParameters header;
	
	/* ***********************************************************
	* Assembler
	*********************************************************** */	
	public AssemblyParameters[] assembly;
	
	/* ***********************************************************
	* Package
	*********************************************************** */	
	public PackageParameters[] packageParameters;
}