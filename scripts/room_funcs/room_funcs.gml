// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function room_gen(_map_width, _map_height, _min_width, _min_height, _max_width, _max_height, _rooms, _map){
	for(var _i=0; _i<_rooms;_i++) {
		// getting room height width
		var _width = round(random_range(_min_width, _max_width));
		var _height = round(random_range(_min_height, _max_height));
		
		// setting room position
		var _pos_x = round(random_range(1, _map_width - _width-1));
		var _pos_y = round(random_range(1, _map_height - _height-1));
		
		// checking if room valid 
		var _create = true;
		for(var _xx=_pos_x; _xx < _pos_x + _width; _xx++) {
			for(var _yy=_pos_y; _yy < _pos_y + _height; _yy++) {
				if _map[_xx][_yy] == EMPTY {
					_create = false;
				}
			}
		}
		
		// creating room
		if _create == true {
			for(var _xx=_pos_x; _xx < _pos_x + _width; _xx++) {
				for(var _yy=_pos_y; _yy < _pos_y + _height; _yy++) {
					_map[_xx][_yy] = EMPTY;
				}
			}
		} else {
			_i--;
		}
	}
	
	return _map;
}