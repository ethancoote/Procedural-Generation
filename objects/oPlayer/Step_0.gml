// get controls
var _i = get_gamepad();
get_controls(_i);

// movement
hor_move = right_key - left_key;
ver_move = down_key - up_key;
x_spd = hor_move * spd;
y_spd = ver_move * spd;

x += x_spd;
y += y_spd;

