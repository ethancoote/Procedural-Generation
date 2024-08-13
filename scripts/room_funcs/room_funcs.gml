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

function set_prizes(_map, _map_width, _map_height) {
	var _center = [round(_map_width/2), round(_map_height/2)];
	 
	for (var _xx = 0; _xx < _map_width; _xx++) {
		for (var _yy = 0; _yy < _map_height; _yy++) {
			if _map[_xx][_yy] == EMPTY {
				var _sides = 0; 
				// checking how many walls surround a position
				if  _map[_xx + 1][_yy] == SOLID {
					_sides += 1;
				} 
				if  _map[_xx - 1][_yy] == SOLID {
					_sides += 1;
				} 
				if  _map[_xx][_yy + 1] == SOLID {
					_sides += 1;
				} 
				if  _map[_xx][_yy - 1] == SOLID {
					_sides += 1;
				} 
				
				// randomly add prizes
				var _dist = dist_between_points(_center[0], _center[1], _xx, _yy);
				var _rand = random(1);
				if _sides == 2 && _dist > 10 {
					if _rand < 0.05 {
						_map[_xx][_yy] = PRIZE;
					}
				} else if _sides == 3 && _dist > 16 && _dist < 24 {
					if _rand < 0.3 {
						_map[_xx][_yy] = PRIZE;
					}
				} else if _sides == 3 && _dist >= 24 {
					if _rand < 0.5 {
						_map[_xx][_yy] = PRIZE;
					}
				}
				
			}
		}
	}
	
	return _map;
}

function dist_between_points(_x1, _y1, _x2, _y2) {
	var _dist = sqrt(sqr(_x1-_x2) + sqr(_y1-_y2));
	return _dist;
}