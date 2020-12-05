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

package com.huguesjohnson.retailclerk.build.test;

import java.util.ArrayList;
import java.util.HashMap;

import org.junit.jupiter.api.Test;

import com.google.gson.Gson;
import com.huguesjohnson.retailclerk.build.BuildInstructions;
import com.huguesjohnson.retailclerk.build.ColorUtils;
import com.huguesjohnson.retailclerk.build.parameters.AssemblyParameters;
import com.huguesjohnson.retailclerk.build.parameters.CollisionDataParameters;
import com.huguesjohnson.retailclerk.build.parameters.HeaderParameters;
import com.huguesjohnson.retailclerk.build.parameters.MemoryMapParameters;
import com.huguesjohnson.retailclerk.build.parameters.PackageParameters;
import com.huguesjohnson.retailclerk.build.parameters.PaletteMapDefinition;
import com.huguesjohnson.retailclerk.build.parameters.PaletteParameters;
import com.huguesjohnson.retailclerk.build.parameters.SpriteDefinition;
import com.huguesjohnson.retailclerk.build.parameters.SpriteParameters;
import com.huguesjohnson.retailclerk.build.parameters.TilesetDefinition;
import com.huguesjohnson.retailclerk.build.parameters.TilesetParameters;

import junit.framework.TestCase;

class TestBuildStuff extends TestCase{

	@Test
	void testColorUtils(){
		String s=ColorUtils.hexStringToGenesisRgb("ff");
		assertEquals("111",s);
		s=ColorUtils.rgbStringToGenesisRgbString("ffe0a040");
		assertEquals("0000010010101110",s);
		s=ColorUtils.genesisRgbStringToHexString("%"+s);
		assertEquals("ffe0a040",s);
		s=ColorUtils.genesisRgbStringToHexString("dc.w\t%0000010010101110 ; blah"+0000010010101110);
		assertEquals("ffe0a040",s);
		ArrayList<String> colors=new ArrayList<String>();
		colors.add("ffe000e0");//00
		colors.add("ff000000");//01
		colors.add("ff806440");//02
		colors.add("ffe0c8a0");//03
		colors.add("ff80a8c0");//04		
		colors.add("ff604020");//05
		colors.add("ffc0a880");//06
		colors.add("ffa06420");//07
		colors.add("ff608440");//08
		colors.add("ff802080");//09
		colors.add("ffc0c8c0");//0A
		colors.add("ffc06420");//0B
		colors.add("ffc00000");//0C
		colors.add("ffe0e8e0");//0D
		colors.add("ffe0c820");//0E
		colors.add("ff6084a0");//0F
		assertEquals(0,ColorUtils.findNearestColor(colors,"ffe000e0"));
		assertEquals(1,ColorUtils.findNearestColor(colors,"ff000000"));
		assertEquals(2,ColorUtils.findNearestColor(colors,"ff806440"));
		assertEquals(3,ColorUtils.findNearestColor(colors,"ffe0c8a0"));
		assertEquals(4,ColorUtils.findNearestColor(colors,"ff80a8c0"));
		assertEquals(5,ColorUtils.findNearestColor(colors,"ff604020"));
		assertEquals(6,ColorUtils.findNearestColor(colors,"ffc0a880"));
		assertEquals(7,ColorUtils.findNearestColor(colors,"ffa06420"));
		assertEquals(8,ColorUtils.findNearestColor(colors,"ff608440"));
		assertEquals(9,ColorUtils.findNearestColor(colors,"ff802080"));
		assertEquals(10,ColorUtils.findNearestColor(colors,"ffc0c8c0"));
		assertEquals(11,ColorUtils.findNearestColor(colors,"ffc06420"));
		assertEquals(12,ColorUtils.findNearestColor(colors,"ffc00000"));
		assertEquals(13,ColorUtils.findNearestColor(colors,"ffe0e8e0"));
		assertEquals(14,ColorUtils.findNearestColor(colors,"ffe0c820"));
		assertEquals(15,ColorUtils.findNearestColor(colors,"ff6084a0"));
		assertEquals(0,ColorUtils.findNearestColor(colors,"ffe000e8"));
		assertEquals(1,ColorUtils.findNearestColor(colors,"ff200000"));
		assertEquals(2,ColorUtils.findNearestColor(colors,"ff806040"));
		assertEquals(3,ColorUtils.findNearestColor(colors,"ffe0c0a0"));
		assertEquals(4,ColorUtils.findNearestColor(colors,"ff80a0c0"));
		assertEquals(5,ColorUtils.findNearestColor(colors,"ff602020"));
		assertEquals(6,ColorUtils.findNearestColor(colors,"ffa0a880"));
		assertEquals(7,ColorUtils.findNearestColor(colors,"ffa06400"));
		assertEquals(8,ColorUtils.findNearestColor(colors,"ff608420"));
		assertEquals(9,ColorUtils.findNearestColor(colors,"ff800080"));
		assertEquals(10,ColorUtils.findNearestColor(colors,"ffc0c0c0"));
		assertEquals(11,ColorUtils.findNearestColor(colors,"ffc06820"));
		assertEquals(12,ColorUtils.findNearestColor(colors,"ffc00020"));
		assertEquals(13,ColorUtils.findNearestColor(colors,"ffe0e8c0"));
		assertEquals(14,ColorUtils.findNearestColor(colors,"ffe0c800"));
		assertEquals(15,ColorUtils.findNearestColor(colors,"ff6080a0"));
	}
	
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
		instructions.palettes=new PaletteParameters();
		instructions.palettes.includeFilePath="src/inc_Palettes.X68";
		instructions.palettes.paletteMap=new PaletteMapDefinition[2];
		instructions.palettes.paletteMap[0]=new PaletteMapDefinition();
		instructions.palettes.paletteMap[0].sourceFilePath="design/img/swatches/people.png";
		instructions.palettes.paletteMap[0].destinationFilePath="src/palettes/People.X68";
		instructions.palettes.paletteMap[1]=new PaletteMapDefinition();
		instructions.palettes.paletteMap[1].sourceFilePath="design/img/swatches/people1.png";
		instructions.palettes.paletteMap[1].destinationFilePath="src/palettes/People1.X68";
		instructions.palettes.paletteMap[1].exclude="true";
		
		/* ***********************************************************
		* Tile parameters
		*********************************************************** */
		instructions.tiles=new TilesetParameters();
		instructions.tiles.tileIncludeFilePath="src/inc_SpriteTiles.X68";
		instructions.tiles.patternIncludeFilePath="src/inc_PatternsGenerated.X68";
		instructions.tiles.tilesets=new TilesetDefinition[2];
		instructions.tiles.tilesets[0]=new TilesetDefinition();
		instructions.tiles.tilesets[0].name="DialogFrame";
		instructions.tiles.tilesets[0].palettePath="src/palettes/People.X68";
		instructions.tiles.tilesets[0].sourceFilePath="design/img/font-dialog-tiles/frame.png";
		instructions.tiles.tilesets[0].destinationFilePath="src/tiles/font-tiles/dialog-frame.X68";
		instructions.tiles.tilesets[1]=new TilesetDefinition();
		instructions.tiles.tilesets[1].name="Font";
		instructions.tiles.tilesets[1].palettePath="src/palettes/People.X68";
		instructions.tiles.tilesets[1].sourceFilePath="design/img/font-dialog-tiles/font.png";
		instructions.tiles.tilesets[1].destinationFilePath="src/tiles/font-tiles/dwf.X68";
		
		/* ***********************************************************
		* Sprite definition parameters
		*********************************************************** */
		SpriteParameters sprites=new SpriteParameters();
		sprites.palettePath="src/palettes/People.X68";
		sprites.includeFilePath="src/inc_SpriteTiles.X68";
		sprites.characterDefinitionFilePath="src/data_CharacterDefinitions.X68";
		sprites.constantDefinitionPath="src/const_CharacterIDs.X68";
		sprites.nameFilePath="src/text/en-us/CharacterNames.X68";
		sprites.nameLookupTableFilePath="src/text/table_CharacterNames.X68";
		sprites.baseId="2000";
		sprites.sprites=new SpriteDefinition[2];
		sprites.sprites[0]=new SpriteDefinition();
		sprites.sprites[0].name="Eryn";
		sprites.sprites[0].sourceFilePath="design/img/sprite-tiles/pc-eryn.png";
		sprites.sprites[0].destinationFilePath="src/tiles/sprite-tiles/pc-eryn.X68";
		sprites.sprites[1]=new SpriteDefinition();
		sprites.sprites[1].name="Carl";
		sprites.sprites[1].sourceFilePath="design/img/sprite-tiles/pc-carl.png";
		sprites.sprites[1].destinationFilePath="src/tiles/sprite-tiles/pc-carl.X68";
		instructions.sprites=sprites;
		
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
		
		/* ***********************************************************
		* Package parameters
		*********************************************************** */
		PackageParameters[] packageParameters=new PackageParameters[3];
		packageParameters[0]=new PackageParameters();
		packageParameters[0].packagePath="/build/RetailClerk90.zip";
		packageParameters[0].includeFilePaths=new String[4];
		packageParameters[0].includeFilePaths[0]="/build/RetailClerk90.bin";
		packageParameters[0].includeFilePaths[1]="CREDITS";
		packageParameters[0].includeFilePaths[2]="LICENSE";
		packageParameters[0].includeFilePaths[3]="README.md";
		packageParameters[1]=new PackageParameters();
		packageParameters[1].packagePath="/build/RetailClerk90_DEBUG.zip";
		packageParameters[1].includeFilePaths=new String[4];
		packageParameters[1].includeFilePaths[0]="/build/RetailClerk90_DEBUG.bin";
		packageParameters[1].includeFilePaths[1]="CREDITS";
		packageParameters[1].includeFilePaths[2]="LICENSE";
		packageParameters[1].includeFilePaths[3]="README.md";
		packageParameters[2]=new PackageParameters();
		packageParameters[2].packagePath="/build/RetailClerk90_ATGAMES.zip";
		packageParameters[2].includeFilePaths=new String[4];
		packageParameters[2].includeFilePaths[0]="/build/RetailClerk90_ATGAMES.bin";
		packageParameters[2].includeFilePaths[1]="CREDITS";
		packageParameters[2].includeFilePaths[2]="LICENSE";
		packageParameters[2].includeFilePaths[3]="README.md";
		instructions.packageParameters=packageParameters;
	
		/* ***********************************************************
		* Print result
		*********************************************************** */
		String json=(new Gson()).toJson(instructions);
		System.out.println(json);
	
	}

}