// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_controls(_i){
	
	// basic movement
	left_key = keyboard_check(vk_left) 
	|| keyboard_check(ord("A")) 
	|| (gamepad_axis_value(_i, gp_axislh) < 0);
	
	right_key = keyboard_check(vk_right) 
	|| keyboard_check(ord("D")) 
	|| (gamepad_axis_value(_i, gp_axislh) > 0);
	
	down_key = keyboard_check(vk_down) 
	|| keyboard_check(ord("S")) 
	|| (gamepad_axis_value(_i, gp_axislv) < 0);
	
	up_key = keyboard_check(vk_up) 
	|| keyboard_check(ord("W")) 
	|| gamepad_axis_value(_i, gp_axislv) > 0;
	
	attack_key = keyboard_check_pressed(ord("P"))
	|| gamepad_button_check_pressed(_i, gp_face3)
	|| keyboard_check_pressed(vk_control);
	
	enter_key = keyboard_check_pressed(vk_enter);
	
	reset_key = keyboard_check(ord("R")) || (gamepad_button_check(_i, gp_shoulderl) && gamepad_button_check(_i, gp_shoulderr));
}

// getting gamepad
function get_gamepad() {
	gamepad = 0;
	for (i=0;i<12; i++) {
		if gamepad_is_connected(i) == true {
			gamepad = i;
			break;
		}
	}
	gamepad_set_axis_deadzone(gamepad, 0.3);
	
	return gamepad;
}