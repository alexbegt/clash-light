draw_set_color(c_white)

switch (isHovering) {
	case true:
		draw_rectangle(mCLEAR_ENEMY_APPEAR_COORDS, false)
		draw_set_color(c_black)
		break;
	case false:
		draw_rectangle(mCLEAR_ENEMY_APPEAR_COORDS, true)
		break;
}

draw_set_font(fnt_blocks)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(x,y,"Clear")