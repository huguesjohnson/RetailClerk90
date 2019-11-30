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
MEM_INTRO_SCENE_COUNTER=$FFFF00A0	; counter for displaying the intro screen
MEM_DAY=$FFFF00A2	; what day is it in the story
MEM_PLAYER_SPRITE=$FFFF00A4	; which sprite to use for the player
MEM_GLOBAL_EVENT_FLAGS=$FFFF00A6	; track events across days
MEM_DAY_EVENT_FLAGS=$FFFF00AA	; track events in the current day
MEM_MISSION_EVENT_FLAGS=$FFFF00AE	; track events in the current mission
MEM_CUSTOMER_FEEDBACK_SCORE=$FFFF00B2	; used for some missions
;-------------------------------------------------------------------------------
; player inventory
;-------------------------------------------------------------------------------
MEM_PLAYER_ITEM_COUNT=$FFFF00B4	; how many items the player is holding
MEM_PLAYER_ITEMS=$FFFF00B6	; four items
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_SPRITE_Y_ORDER_CHANGED=$FFFF00BE	; track if sprite order has changed
MEM_PLAYER_SPRITE_ID=$FFFF00C0	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF00C2	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF00C4	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF00C6	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF00C8	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF00CA	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF00CC	; used to determine when to move
MEM_PLAYER_MOVEMENT_COUNTER=$FFFF00CE	; used to determine how far to move
MEM_PLAYER_MOVE_FREQUENCY=$FFFF00D0	; how often to move
MEM_PLAYER_MOVE_PATTERN=$FFFF00D2	; movement pattern
MEM_PLAYER_MOVE_PATTERN_LENGTH=$FFFF00D6	; length of movement pattern
MEM_PLAYER_MOVE_INDEX=$FFFF00D8	; where the sprite is the movement pattern
MEM_NPC0_SPRITE_ID=$FFFF00DA	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF00DC	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF00DE	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF00E0	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF00E2	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF00E4	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF00E6	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF00E8	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF00EA	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF00EC	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF00F0	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF00F2	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF00F4	; sprite table id of NPC1 sprite
MEM_NPC1_SPRITE_X=$FFFF00F6	; virtual x position of NPC1 sprite
MEM_NPC1_SPRITE_Y=$FFFF00F8	; virtual y position of NPC1 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF00FA	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF00FC	; which direction NPC1 faces
MEM_NPC1_SPRITE_FRAME=$FFFF00FE	; animation frame of NPC1 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF0100	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF0102	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF0104	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF0106	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF010A	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF010C	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF010E	; sprite table id of NPC2 sprite
MEM_NPC2_SPRITE_X=$FFFF0110	; virtual x position of NPC2 sprite
MEM_NPC2_SPRITE_Y=$FFFF0112	; virtual y position of NPC2 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF0114	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF0116	; which direction NPC2 faces
MEM_NPC2_SPRITE_FRAME=$FFFF0118	; animation frame of NPC2 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF011A	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF011C	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF011E	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF0120	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF0124	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF0126	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF0128	; sprite table id of NPC3 sprite
MEM_NPC3_SPRITE_X=$FFFF012A	; virtual x position of NPC3 sprite
MEM_NPC3_SPRITE_Y=$FFFF012C	; virtual y position of NPC3 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF012E	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF0130	; which direction NPC3 faces
MEM_NPC3_SPRITE_FRAME=$FFFF0132	; animation frame of NPC3 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF0134	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF0136	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF0138	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF013A	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF013E	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF0140	; where the sprite is the movement pattern
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF0142	; ID of the active scene
MEM_ACTIVE_SCENE_EXIT_S=$FFFF0144	; south exit of active scene
MEM_ACTIVE_SCENE_EXIT_N=$FFFF0146	; north exit of active scene
MEM_ACTIVE_SCENE_EXIT_W=$FFFF0148	; west exit of active scene
MEM_ACTIVE_SCENE_EXIT_E=$FFFF014A	; east exit of active scene
MEM_ACTIVE_NPC_COUNT=$FFFF014C	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF014E	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF018A	; list of npcs in current map
MEM_SCENE_BGM=$FFFF01A2	; reference to current background music
MEM_SCENE_PALETTE=$FFFF01A6	; storing for fade in/out
;-------------------------------------------------------------------------------
; dialog & menu management
;-------------------------------------------------------------------------------
MEM_MENU_SELECTION=$FFFF0226	; which menu item is selected - used for sprite 0
MEM_MENU_RESPONSE=$FFFF0228	; which dialog choice was selected
MEM_DIALOG_FLAGS=$FFFF022A	; used to manage dialogs
MEM_DIALOG_TITLE=$FFFF022E	; pointer to location of dialog title
MEM_DIALOG_TEXT=$FFFF0232	; pointer to location of dialog text
MEM_DIALOG_VDP=$FFFF0236	; pointer to VPD location to write text
MEM_DIALOG_ITEM_LIST=$FFFF023A	; pointer to location of item list to display
MEM_DIALOG_ITEM_INDEX=$FFFF023E	; track which item in the list is being drawn
;-------------------------------------------------------------------------------
; scripted event management
;-------------------------------------------------------------------------------
MEM_SCRIPTED_EVENT_ADDR=$FFFF0240	; pointer to scripted event running
MEM_SCRIPTED_EVENT_ACTION=$FFFF0244	; current scripted event action
MEM_SCRIPTED_EVENT_STEPS=$FFFF0246	; steps remaining in current action
MEM_SCRIPTED_SPRITE_ADDR=$FFFF0248	; which sprite to move
;-------------------------------------------------------------------------------
; temp working space
;-------------------------------------------------------------------------------
MEM_TEMP_SPACE=$FFFF024C	; temp working space
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF028C	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF028E	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF0290	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF0292	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF0294	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF0296	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF0298	; row of map data
MEM_COLLISION_RESULT=$FFFF029C	; result of collision test
MEM_COLLISION_DATA=$FFFF029E	; collision data for the current map
MEM_END=$FFFF039E
