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

public enum ScriptedEventCommand{
	END(0xFFFF),
	DIALOG(0xEEEE),
	CHANGE_SPRITE(0xDDDD),
	CHANGE_SCENE(0xCCCC),
	CHANGE_CHANGE_PLAYER_SPRITE(0xBBBB),
	SET_PLAYER_SPRITE_X(0xAAAA),
	SET_PLAYER_SPRITE_Y(0x9999),
	SET_PLAYER_SPRITE_DIRECTION(0x8888),
	FADE_BLACK(0x7777),
	DRAW_SCENE(0x6666),
	TIMER(0x5555),
	ENDGAME(0x4444);
	
	private final int value;
	ScriptedEventCommand(final int value){this.value=value;}
    public int getValue(){return(value);}

    @Override
	public String toString(){
    	if(this.value==DIALOG.value){return("SCRIPTED_EVENT_DIALOG");}
    	if(this.value==CHANGE_SPRITE.value){return("SCRIPTED_EVENT_CHANGE_SPRITE");}
    	if(this.value==CHANGE_SCENE.value){return("SCRIPTED_EVENT_CHANGE_SCENE");}
    	if(this.value==CHANGE_CHANGE_PLAYER_SPRITE.value){return("SCRIPTED_EVENT_CHANGE_PLAYER_SPRITE");}
    	if(this.value==SET_PLAYER_SPRITE_X.value){return("SCRIPTED_EVENT_SET_PLAYER_SPRITE_X");}
    	if(this.value==SET_PLAYER_SPRITE_Y.value){return("SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y");}
    	if(this.value==SET_PLAYER_SPRITE_DIRECTION.value){return("SCRIPTED_EVENT_SET_PLAYER_SPRITE_DIRECTION");}
    	if(this.value==FADE_BLACK.value){return("SCRIPTED_EVENT_FADE_BLACK");}
    	if(this.value==DRAW_SCENE.value){return("SCRIPTED_EVENT_DRAW_SCENE");}
    	if(this.value==TIMER.value){return("SCRIPTED_EVENT_TIMER");}
    	if(this.value==ENDGAME.value){return("SCRIPTED_EVENT_ENDGAME");}
		return("SCRIPTED_EVENT_END");//safest default return value
	}

}