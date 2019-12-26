MEM_START=$FFFF0000
;-------------------------------------------------------------------------------
; debug registers
;-------------------------------------------------------------------------------
MEM_DEBUG_1=$FFFF0000	; general debug register
MEM_DEBUG_2=$FFFF0002	; general debug register
;-------------------------------------------------------------------------------
; table to sort the draw order of sprites
;-------------------------------------------------------------------------------
MEM_SPRITE_SORT_TABLE_SORTED=$FFFF0004	; 0000=sorted
MEM_SPRITE_SORT_TABLE_ID0=$FFFF0006	; sort table ID 0
MEM_SPRITE_SORT_TABLE_VALUE0=$FFFF0008	; sort table value 0
MEM_SPRITE_SORT_TABLE_ID1=$FFFF000A	; sort table ID 1
MEM_SPRITE_SORT_TABLE_VALUE1=$FFFF000C	; sort table value 1
MEM_SPRITE_SORT_TABLE_ID2=$FFFF000E	; sort table ID 2
MEM_SPRITE_SORT_TABLE_VALUE2=$FFFF0010	; sort table value 2
MEM_SPRITE_SORT_TABLE_ID3=$FFFF0012	; sort table ID 3
MEM_SPRITE_SORT_TABLE_VALUE3=$FFFF0014	; sort table value 3
MEM_SPRITE_SORT_TABLE_ID4=$FFFF0016	; sort table ID 4
MEM_SPRITE_SORT_TABLE_VALUE4=$FFFF0018	; sort table value 4
;-------------------------------------------------------------------------------
; counters
;-------------------------------------------------------------------------------
MEM_VBLANK_COUNTER=$FFFF001A	; incremented at vblank - used for debug & RNG
MEM_MAINLOOP_COUNTER=$FFFF001C	; used for debug & RNG
MEM_FRAME_COUNTER=$FFFF001E	; current frame
;-------------------------------------------------------------------------------
; program flow
;-------------------------------------------------------------------------------
MEM_NPC_LOOP_COUNTER=$FFFF0020	; used for loop control in main
;-------------------------------------------------------------------------------
; controller input
;-------------------------------------------------------------------------------
MEM_CONTROL_1_ID=$FFFF0022	; what type of controller is connected
MEM_CONTROL_1_6BUTTON=$FFFF0024	; whether first controller is 6 button
MEM_CONTROL_HELD=$FFFF0026	; store value of regular held buttons
MEM_CONTROL_PRESSED=$FFFF0028	; store value of regular pressed buttons
MEM_CONTROL_6_HELD=$FFFF002A	; store value of extra held buttons
MEM_CONTROL_6_PRESSED=$FFFF002C	; store value of extra pressed buttons
;-------------------------------------------------------------------------------
; game state
;-------------------------------------------------------------------------------
; MEM_OBJECTIVE is first because it's used for save game title 
MEM_OBJECTIVE=$FFFF002E	; which text to show on objectives
MEM_GAME_STATE=$FFFF0030	; used to control the main loop flow
MEM_ACTION_ID=$FFFF0034	; current action selected by player
MEM_ACTION_TARGET_OBJID=$FFFF0036	; action target object id
MEM_ACTION_TARGET_NPCID=$FFFF0038	; NPC id if action target is an NPC
MEM_ACTION_TARGET_NPC_DIRECTION=$FFFF003A	; put NPC back in right direction
MEM_ACTION_TABLE_OFFSET=$FFFF003C	; relative address of action table entry
MEM_ACTIVE_ITEM=$FFFF003E	; item that is currently being used
MEM_NPC_LOCATIONS=$FFFF0040	; table to track where NPCs are located
MEM_INTRO_SCENE_COUNTER=$FFFF00C0	; counter for displaying the intro screen
MEM_DAY=$FFFF00C2	; what day is it in the story
MEM_PLAYER_SPRITE=$FFFF00C4	; which sprite to use for the player
MEM_GLOBAL_EVENT_FLAGS=$FFFF00C6	; track events across days
MEM_DAY_EVENT_FLAGS=$FFFF00CA	; track events in the current day
MEM_MISSION_EVENT_FLAGS=$FFFF00CE	; track events in the current mission
MEM_CUSTOMER_FEEDBACK_SCORE=$FFFF00D2	; used for some missions
;-------------------------------------------------------------------------------
; player inventory
;-------------------------------------------------------------------------------
MEM_PLAYER_ITEM_COUNT=$FFFF00D4	; how many items the player is holding
MEM_PLAYER_ITEMS=$FFFF00D6	; four items
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_SPRITE_Y_ORDER_CHANGED=$FFFF00DE	; track if sprite order has changed
MEM_PLAYER_SPRITE_ID=$FFFF00E0	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF00E2	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF00E4	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF00E6	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF00E8	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF00EA	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF00EC	; used to determine when to move
MEM_PLAYER_MOVEMENT_COUNTER=$FFFF00EE	; used to determine how far to move
MEM_PLAYER_MOVE_FREQUENCY=$FFFF00F0	; how often to move
MEM_PLAYER_MOVE_PATTERN=$FFFF00F2	; movement pattern
MEM_PLAYER_MOVE_PATTERN_LENGTH=$FFFF00F6	; length of movement pattern
MEM_PLAYER_MOVE_INDEX=$FFFF00F8	; where the sprite is the movement pattern
MEM_NPC0_SPRITE_ID=$FFFF00FA	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF00FC	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF00FE	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF0100	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF0102	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF0104	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF0106	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF0108	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF010A	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF010C	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF0110	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF0112	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF0114	; sprite table id of NPC1 sprite
MEM_NPC1_SPRITE_X=$FFFF0116	; virtual x position of NPC1 sprite
MEM_NPC1_SPRITE_Y=$FFFF0118	; virtual y position of NPC1 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF011A	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF011C	; which direction NPC1 faces
MEM_NPC1_SPRITE_FRAME=$FFFF011E	; animation frame of NPC1 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF0120	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF0122	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF0124	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF0126	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF012A	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF012C	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF012E	; sprite table id of NPC2 sprite
MEM_NPC2_SPRITE_X=$FFFF0130	; virtual x position of NPC2 sprite
MEM_NPC2_SPRITE_Y=$FFFF0132	; virtual y position of NPC2 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF0134	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF0136	; which direction NPC2 faces
MEM_NPC2_SPRITE_FRAME=$FFFF0138	; animation frame of NPC2 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF013A	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF013C	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF013E	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF0140	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF0144	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF0146	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF0148	; sprite table id of NPC3 sprite
MEM_NPC3_SPRITE_X=$FFFF014A	; virtual x position of NPC3 sprite
MEM_NPC3_SPRITE_Y=$FFFF014C	; virtual y position of NPC3 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF014E	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF0150	; which direction NPC3 faces
MEM_NPC3_SPRITE_FRAME=$FFFF0152	; animation frame of NPC3 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF0154	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF0156	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF0158	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF015A	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF015E	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF0160	; where the sprite is the movement pattern
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF0162	; ID of the active scene
MEM_ACTIVE_SCENE_EXIT_S=$FFFF0164	; south exit of active scene
MEM_ACTIVE_SCENE_EXIT_N=$FFFF0166	; north exit of active scene
MEM_ACTIVE_SCENE_EXIT_W=$FFFF0168	; west exit of active scene
MEM_ACTIVE_SCENE_EXIT_E=$FFFF016A	; east exit of active scene
MEM_ACTIVE_NPC_COUNT=$FFFF016C	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF016E	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF01AA	; list of npcs in current map
MEM_SCENE_BGM=$FFFF01C2	; reference to current background music
MEM_SCENE_PALETTE=$FFFF01C6	; storing for fade in/out
;-------------------------------------------------------------------------------
; dialog & menu management
;-------------------------------------------------------------------------------
MEM_MENU_SELECTION=$FFFF0246	; which menu item is selected - used for sprite 0
MEM_MENU_RESPONSE=$FFFF0248	; which dialog choice was selected
MEM_DIALOG_FLAGS=$FFFF024A	; used to manage dialogs
MEM_DIALOG_TITLE=$FFFF024E	; pointer to location of dialog title
MEM_DIALOG_TEXT=$FFFF0252	; pointer to location of dialog text
MEM_DIALOG_VDP=$FFFF0256	; pointer to VPD location to write text
MEM_DIALOG_ITEM_LIST=$FFFF025A	; pointer to location of item list to display
MEM_DIALOG_ITEM_INDEX=$FFFF025E	; track which item in the list is being drawn
;-------------------------------------------------------------------------------
; scripted event management
;-------------------------------------------------------------------------------
MEM_SCRIPTED_EVENT_ADDR=$FFFF0260	; pointer to scripted event running
MEM_SCRIPTED_EVENT_ACTION=$FFFF0264	; current scripted event action
MEM_SCRIPTED_EVENT_STEPS=$FFFF0266	; steps remaining in current action
MEM_SCRIPTED_SPRITE_ADDR=$FFFF0268	; which sprite to move
;-------------------------------------------------------------------------------
; temp working space
;-------------------------------------------------------------------------------
MEM_TEMP_SPACE=$FFFF026C	; temp working space
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF02AC	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF02AE	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF02B0	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF02B2	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF02B4	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF02B6	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF02B8	; row of map data
MEM_COLLISION_RESULT=$FFFF02BC	; result of collision test
MEM_COLLISION_DATA=$FFFF02BE	; collision data for the current map
MEM_END=$FFFF03BE
