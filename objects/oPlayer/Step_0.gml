// get controls
var _i = get_gamepad();
get_controls(_i);

// movement
hor_move = right_key - left_key;
ver_move = down_key - up_key;
x_spd = hor_move * spd;
y_spd = ver_move * spd;

// diagonal slow
if x_spd != 0 && y_spd != 0 {
	x_spd = x_spd * .707;
	y_spd = y_spd * .707;
}

// pickup item
var _inst = instance_place(x, y, oPrize1)
if  _inst != noone {
	var _map_pos = [_inst.x/16, _inst.y/16];
	oCellGen.cell_map[_map_pos[0]][_map_pos[1]] = EMPTY;
	instance_destroy(_inst);
}

// y collision
var _sub_pixel = 0.5;
if place_meeting(x, y+y_spd, walls) {
	var _pixel_check = _sub_pixel * sign(y_spd);
	
	while !place_meeting(x, y + _pixel_check, walls) {
		y += _pixel_check;
	}
	y_spd = 0;
}

y += y_spd;

// x collision
if place_meeting(x+x_spd, y, walls) {
	var _pixel_check = _sub_pixel * sign(x_spd);
	
	while !place_meeting(x + _pixel_check, y, walls) {
		x += _pixel_check;
	}
	x_spd = 0;
}

x += x_spd;

