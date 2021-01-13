draw_set_color(c_white)
draw_set_font(fnt_blocks)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
var _highlighted = isHovering || (mBATTLE.current_partymem = reg_space);
switch (_highlighted) {
	case true:
	draw_rectangle(mAPPEAR_COORDS, false)
	draw_set_color(c_black)
	break;
	case false:
	draw_rectangle(mAPPEAR_COORDS, true)
	break;
}
if (choiceWep != -1 && choiceTrack != -1) {
	draw_text(x, y, string_upper(string_copy(choiceTrack, 0, 3)) + string(choiceWep + 1))
}
draw_set_color(c_white)
draw_set_valign(fa_top)
draw_text_ext(x, y + (appear_height / 2), given_name + "\n" + string(currentHP) + " / " + string(maxHP), font_get_size(fnt_blocks) * 1.5, view_wport[0])
if (choiceTarget != -1) {
	draw_set_valign(fa_bottom)
	draw_set_font(fnt_mini)
	draw_text(x, y - (appear_height / 2) + 3, notate_target(choiceTarget));
}