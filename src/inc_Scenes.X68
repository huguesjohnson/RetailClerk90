	;---------------------------------------------------------------------------
	; title, end scenes
	;---------------------------------------------------------------------------
	include 'scenes/Legal.X68'
	include 'scenes/Title.X68'
	include 'scenes/Load.X68'
	if _DEBUG_
	include 'scenes/DebugMenu.X68'
	endif

	;---------------------------------------------------------------------------
	; status screen
	;---------------------------------------------------------------------------
	include 'scenes/MenuMap.X68'
	include 'scenes/MenuStatus.X68'
	include 'scenes/MenuData.X68'
	include 'scenes/MenuHelp.X68'

	;---------------------------------------------------------------------------
	; stores
	;---------------------------------------------------------------------------
	; SCENE_ID_VB=$0000
	include 'scenes/VB.X68'

	; SCENE_ID_WWHALL=$0001
	include 'scenes/WWHall.X68'

	; SCENE_ID_WEHALL=$0002
	include 'scenes/WEHall.X68'

	; SCENE_ID_CENTER=$0003
	include 'scenes/Center.X68'

	; SCENE_ID_SHALL=$0004
	include 'scenes/SHall.X68'

	; SCENE_ID_CAVERN_BACKROOM=$0005
	include 'scenes/CavernBackroom.X68'

	; SCENE_ID_EWHALL=$0006
	include 'scenes/EWHall.X68'

	; SCENE_ID_EEHALL=$0007
	include 'scenes/EEHall.X68'

	; SCENE_ID_DENIMCOUNTRY=$0008
	include 'scenes/DenimCountry.X68'

	; SCENE_ID_CHECKERS=$0009
	include 'scenes/Checkers.X68'

	; SCENE_ID_TLODGE=$000A
	include 'scenes/TLodge.X68'

	; SCENE_ID_CAVERN=$000B
	include 'scenes/Cavern.X68'

	; SCENE_ID_SVIDEO=$000C
	include 'scenes/SVideo.X68'

	; SCENE_ID_NSHACK=$000D
	include 'scenes/NShack.X68'

	; SCENE_ID_POGODAWG=$000F
	include 'scenes/PogoDawg.X68'

	; SCENE_ID_CPLANET=$0010
	include 'scenes/CPlanet.X68'

	; SCENE_ID_CNOW=$0011
	include 'scenes/CNow.X68'

	; SCENE_ID_TBOOKS=$0012
	include 'scenes/TBooks.X68'

	; SCENE_ID_FCBCHECKOUT=$0013
	include 'scenes/FCBCheckout.X68'

	; SCENE_ID_FCBFIREARMS=$0014
	include 'scenes/FCBFirearms.X68'

	; SCENE_ID_FCBFISHING=$0015
	include 'scenes/FCBFishing.X68'

	; SCENE_ID_FCBCAMPING=$0016
	include 'scenes/FCBCamping.X68'

	; SCENE_ID_SOUTH_CENTER=$0017
	include 'scenes/SouthCenter.X68'

	; SCENE_ID_WWCHECKOUT=$0018
	include 'scenes/WWCheckout.X68'

	; SCENE_ID_WWTV=$0019
	include 'scenes/WWTV.X68'

	; SCENE_ID_WWAUDIO=$001A
	include 'scenes/WWAudio.X68'

	; SCENE_ID_WWAPPLIANCES=$001B
	include 'scenes/WWAppliances.X68'

	; SCENE_ID_BASEMENTWDORM=$001C
	include 'scenes/BasementWDorm.X68'

	; SCENE_ID_BASEMENTMDORM=$001D
	include 'scenes/BasementMDorm.X68'

	; SCENE_ID_BASEMENTCAFE=$001E
	include 'scenes/BasementCafe.X68'

	; SCENE_ID_BASEMENTOFFICE=$001F
	include 'scenes/BasementOffice.X68'

	;---------------------------------------------------------------------------
	; day transition screens
	;---------------------------------------------------------------------------
	include 'scenes/IntroDay00.X68'
	include 'scenes/IntroDay01.X68'
	include 'scenes/IntroDay02.X68'
	include 'scenes/IntroDay03.X68'
	include 'scenes/IntroDay04.X68'
	include 'scenes/IntroDay05.X68'
	include 'scenes/IntroDay06.X68'

