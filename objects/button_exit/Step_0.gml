isHovering = (point_in_rectangle(mouse_x, mouse_y, mEXIT_BUTTON_APPEAR_COORDS))

if (isHovering) {
	if (mouse_check_button_pressed(mb_left)) {
		game_end()
	}
}