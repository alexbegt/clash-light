if (editValue) {
	editValue = false;
}

isHovering = (point_in_rectangle(mouse_x, mouse_y, mADJUST_TRIGGER_APPEAR_COORDS))

if (isHovering) {
	if (mouse_check_button_pressed(mb_left)) {
		editValue = !editValue;
	}
}