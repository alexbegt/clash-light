#macro mBATTLE obj_master_battle
#macro mCURRENT_MEM reg_party[| current_partymem]
#macro mHOVERING_MEM reg_party[| hovering_partymem]
#macro mBUTTON_COORDS _button.x1, _button.y1, _button.x2, _button.y2
#macro mPRES_COORDS _pres.x1, _pres.y1, _pres.x2, _pres.y2
#macro mBUTTON_CENTER mean(_button.x1, _button.x2), mean(_button.y1, _button.y2)
#macro mACTIVE_COORDS _activeButton.x1, _activeButton.y1, _activeButton.x2, _activeButton.y2
#macro mACTIVE_CENTER mean(_activeButton.x1, _activeButton.x2), mean(_activeButton.y1, _activeButton.y2)
#macro mBUTTON_CENTER_Y mean(_button.y1, _button.y2)
#macro mHEADER_CENTER_X mean(_trackHeader.x1, _trackHeader.x2)
#macro mPRES_CENTER mean(_pres.x1, _pres.x2), mean(_pres.y1, _pres.y2)
#macro mWEPBACK_COORDS _wepBack.x1, _wepBack.y1, _wepBack.x2, _wepBack.y2
#macro mWEPBACK_CENTER mean(_wepBack.x1, _wepBack.x2), mean(_wepBack.y1, _wepBack.y2)
#macro mENEMYBACK_COORDS _enemyBack.x1, _enemyBack.y1, _enemyBack.x2, _enemyBack.y2

//state management
enum battleState {
	intro,
	p_choice,
	p_target,
	p_attack,
	e_attack,
}

currentState = battleState.intro;

currentWep = -1;
currentTrack = -1;
hoveringWep = false;
hoveringAct = false;
wepString = "";

inst_calc = -1;
inst_wepgui = -1;

//register participants
reg_party = ds_list_create()
reg_enemy = ds_list_create()
ds_list_clear(reg_party)
ds_list_clear(reg_enemy)

current_partymem = 0;
hovering_partymem = -1;
hovering_enemy = -1;

//temp: spawn battle participants with inventories
//Register pm names
var _tempNames = array_create(temp_AmtParty, "Void")
var _pmNamesFile = file_text_open_read("placeholder_pmNames.txt");
var _n = 0;

while(!file_text_eoln(_pmNamesFile)) {
	_tempNames[_n++] = string_replace(file_text_readln(_pmNamesFile), "\r\n", "");
}

file_text_close(_pmNamesFile)

//temp party filler
for (i = 0; i < temp_AmtParty; ++i) {
	//create party member
	var _addToParty = instance_create_layer(view_wport[0] * ((2 + i) / (3 + temp_AmtParty)), view_hport[0] - 64, "Instances", par_battle_partymem)
	//assign name and place
	_addToParty.given_name = _tempNames[i];
	_addToParty.reg_space = i;
	
	var _track = ""
	
	for (t = 0; t < ds_map_size(mWEP.wTracks); ++t) {
		_track = mWEP.trackNames[| t]
		initialize_track(_addToParty, _track, true);
		add_weapon(_addToParty, _track, 7, 1)
	}
	
	refresh_tracks(_addToParty, 1);
	//register party member
	reg_party[| i] = _addToParty;
}