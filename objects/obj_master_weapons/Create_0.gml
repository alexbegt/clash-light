#macro mWEP obj_master_weapons

//Register all possible party member weapons - Default
wTracks = ds_map_create();
trackNames = ds_list_create();
var _tracksFile = file_text_open_read(tracksFileName);
var _n = 0;
while(!file_text_eoln(_tracksFile)) {
	trackNames[| _n] = string_replace(file_text_readln(_tracksFile), "\r\n", "");
	ds_map_add(wTracks, trackNames[| _n], add_default_track(trackNames[| _n]));
	++_n;
}
file_text_close(_tracksFile)

//Register all possible debuffs - Default
debuffNames = ds_list_create();
var _debuffsFile = file_text_open_read(debuffsFileName);
var _n = 0;
while(!file_text_eoln(_debuffsFile)) {
	debuffNames[| _n] = string_replace(file_text_readln(_debuffsFile), "\r\n", "");
	++_n;
}
file_text_close(_tracksFile)

//Register colors
trackColors = ds_map_create();
var _colorsFile = file_text_open_read(colorsFileName);
var _n = 0;
while(!file_text_eoln(_colorsFile)) {
	 var _hexArray = array_create(3, "");
	 var _rgbArray = array_create(3, 0);
	 var _hexLine = file_text_readln(_colorsFile)
	 for (var i = 0; i < 3; ++i) {
		 _hexArray[i] = string_copy(_hexLine, 1 + (i * 2), 2);
	 }
	 for (var i = 0; i < 3; ++i) {
		 _rgbArray[i] = real(base_convert(_hexArray[i], 16, 10))
	 }
	 trackColors[? ds_list_find_value(trackNames, _n++)] = make_color_rgb(_rgbArray[0], _rgbArray[1], _rgbArray[2])
}
file_text_close(_colorsFile)

//Register attack scripts
trackScripts = ds_map_create()
for (var i = 0; i < ds_list_size(trackNames); ++i) {
	ds_map_add(trackScripts, trackNames[| i], asset_get_index("wep_" + trackNames[| i]));
}

//Finish init
room_goto_next()