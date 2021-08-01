// GUI
draw_set_color(c_purple)

switch (currentState) {
	case battleState.intro:
		draw_set_color(c_black)
		draw_rectangle(0, 0, view_wport[0], view_hport[0], false)
		draw_set_color(c_white)
		draw_set_font(useFont)
		draw_set_valign(fa_middle)
		draw_set_halign(fa_center)
		draw_text(view_wport[0] / 2, view_hport[0] / 2, "Begin battle!")
		break;
	case battleState.p_choice:
		//draw weapon GUI background
		
		if (!hoveringWep) {
			currentWep = -1;
			currentTrack = -1;
			wepString = "";
		}
		
		hoveringWep = false;
		
		if (!hoveringAct) {
			actMisc = false;
		}
		
		hoveringAct = false;
		break;
	case battleState.p_target:
		draw_set_color(c_white)
		draw_set_font(useFont)
		draw_set_valign(fa_middle)
		draw_text(view_wport[0] / 2, view_hport[0] * (3 / 4), "Choose A Target\nPress M2 to Cancel")
		break;
	case battleState.p_attack:
		draw_set_color(c_white)
		draw_set_font(useFont)
		draw_set_valign(fa_middle)
		draw_text(view_wport[0] / 2, view_hport[0] * (3 / 4), "Attack Phase\nPlease wait...")
		break;
	case battleState.e_attack:
		draw_set_color(c_white)
		draw_set_font(useFont)
		draw_set_valign(fa_middle)
		draw_text(view_wport[0] / 2, view_hport[0] * (3 / 4), "Player Turn Over\nPress M1 to Continue\nPress M2 to Retry this Set")
		break;
	}

// debug
/*
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_color(c_white)
draw_set_font(useFont)
draw_text(0,0,string(currentState) + "\n" + mCURRENT_MEM.given_name + "\n" + wepString);
*/

draw_set_color(c_white)
draw_set_font(useFont)
draw_set_halign(fa_right)
draw_set_valign(fa_bottom)
draw_text(view_wport[0], view_hport[0], "https://github.com/\nBuckstrom/clash-light\nCheck README\nfor controls.\nHave fun! :-)\n~King Pants")
draw_set_halign(fa_left)