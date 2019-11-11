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

package com.huguesjohnson.retailclerk.build.test;

import java.util.HashMap;

import org.junit.jupiter.api.Test;

import com.google.gson.Gson;
import com.huguesjohnson.retailclerk.build.BuildInstructions;
import com.huguesjohnson.retailclerk.build.parameters.AssemblyParameters;
import com.huguesjohnson.retailclerk.build.parameters.CollisionDataParameters;
import com.huguesjohnson.retailclerk.build.parameters.HeaderParameters;
import com.huguesjohnson.retailclerk.build.parameters.MemoryMapParameters;

class TestBuildStuff{

	@Test
	void testBuildInstructions(){
		/*
		 * Test that everything gets to/from json correctly
		 * Also doubles as a way to build the initial instructions file
		 */
		BuildInstructions instructions=new BuildInstructions();
		instructions.basePath=".";
		/* ***********************************************************
		* Memory map parameters
		*********************************************************** */
		instructions.memoryMap=new MemoryMapParameters();
		instructions.memoryMap.sourceFile="src/MemoryMap.csv";
		instructions.memoryMap.destinationFile="src/const_MemoryMap.X68";
		instructions.memoryMap.baseAddress="FFFF0000";
		/* ***********************************************************
		* Collision data parameters
		*********************************************************** */
		instructions.collision=new CollisionDataParameters();
		instructions.collision.includeFilePath="src/inc_CollisionMaps.X68";
		instructions.collision.collisionMap=new HashMap<String,String>();
		instructions.collision.collisionMap.put(
				"design/collision/store-00-512x512.bmp",
				"src/collision-maps/map_Store00Collision.X68");
		
		/* ***********************************************************
		* Palettes parameters
		*********************************************************** */
		//TODO
		
		/* ***********************************************************
		* Tile parameters
		*********************************************************** */
		//TODO
		
		/* ***********************************************************
		* Sprite definition parameters
		*********************************************************** */
		//TODO
		
		/* ***********************************************************
		* Header parameters
		*********************************************************** */
		HeaderParameters header=new HeaderParameters();
		header.filePath="src/init_Header.X68";
		header.copyright="'(C)HUJO '";
		header.cartName="'Retail Clerk 90                                 '";
		header.romStart="$00000000";
		header.romEnd="RomEnd";
		header.ramStartEnd="$FFFF0000,$FFFFFFFF";
		header.sramType="'RA',$F8,$20";
		header.sramStart="SRAM_START";
		header.sramEnd="SRAM_END";
		header.comment="'http://huguesjohnson.com/               '";		
		instructions.header=header;
		/* ***********************************************************
		* Compile parameters
		*********************************************************** */
		AssemblyParameters assembly=new AssemblyParameters();
		instructions.assembly=new AssemblyParameters[3];
		assembly.assemblerPath="src/";
		assembly.arguments="vasmm68k_mot -o ../build/RetailClerk90.bin -Fbin -spaces -D_DEBUG_=0 -D_ATGAMES_HACKS_=0 RetailClerk90.X68";
		instructions.assembly[0]=assembly;
		assembly.arguments="vasmm68k_mot -o ../build/RetailClerk90_DEBUG.bin -Fbin -spaces -D_DEBUG_=1 -D_ATGAMES_HACKS_=0 RetailClerk90.X68";
		instructions.assembly[1]=assembly;
		assembly.arguments="vasmm68k_mot -o ../build/RetailClerk90_ATGAMES.bin -Fbin -spaces -D_DEBUG_=0 -D_ATGAMES_HACKS_=1 RetailClerk90.X68";
		instructions.assembly[2]=assembly;
		String json=(new Gson()).toJson(instructions);
		System.out.println(json);
	}

}