// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function clear_target(partyMember){
	partyMember.choiceTarget = -1;
	partyMember.choiceTrack = -1;
	partyMember.choiceWep = -1;
	partyMember.nextAction = false;
}

function clear_target_row(){
	for (var i = 0; i < ds_list_size(mBATTLE.reg_party); ++i) {
		var _partyMember = mBATTLE.reg_party[| i];
		clear_target(_partyMember);
	}
}