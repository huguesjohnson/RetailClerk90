# Retail Clerk '90
A casual adventure game for the Sega Genesis written in 68000 assembly, with some help from code generation tools built in Java.

This is a sequel to Retail Clerk '89. Practically no one played it but I made a sequel anyway. The story is fairly connected to the first game. The plot might not make sense without playing Retail Clerk '89. It also might not make sense even if you do because I'm not a good writer.

This isn't really about making an awesome Genesis game though. The main goal of this demo is to improve on the engine and tooling developed for Retail Clerk '89. I have this hazy idea for a set of tools to build adventure-like games for classic consoles. If I accidentally produce an OK game along the way I guess that's nice. The Genesis is the first console I'm trying this idea on because.. well, I don't recall why I chose it. Assuming I stick with this then maybe I'll port all of this to another console.

The rough list of enhancements from Retail Clerk '89 -> '90 includes:

* Auto-generate anything that can reasonably be auto-generated
* Adding fast travel on the map
* Generally overhauling the status menu and map
* Simplify interactions with items and NPCs - this will make the game less annoying and also allow for 2-button systems to be supported later (yes this is a hint about future systems I might possibly try to port this to)
* A very basic "free time" system that also serves as an even more basic bonding-like system - this is blatantly ripping-off the bonding system in the Trails series and Tokyo Xanadu, although it's much smaller and less fun, I assume those games are ripping-off Persona which was probably inspired by something else and so on
* Make scene change events part of action table - this probably sounds like gibberish to anyone that's not me but trust me, it's a big code improvement
* Supporting add/remove item in scripted events - this also probably sounds like gibberish to anyone that's not me
* Moving other things to scripted events like NPC locations, palette changes, and font changes - this means more code is auto-generated which will make the Retail Clerk game engine more portable if I ever want to do that

**Development Status**

There's a version 1.0 build available on the project page. Unless a significant bug is found that is the final version.

There's a lot I could to do improve this demo. I'm a bit burned out on it though. It might be a while before I develop another retro console demo.

**Links**

Project page - https://www.huguesjohnson.com/rc90/

**Disclaimers**

This demo is (obviously) not licensed by Sega, there is no relationship between the author of this demo and Sega.

The setting is based on various malls I frequented in the 80s-90s. However all characters, places, and events are fictitious.
