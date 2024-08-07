// initialize the starting room
function init_map(_start_width, _start_height, _map_width, _map_height) {
	var _map = [];
	
	// getting map center
	var _center = [round(_map_width/2),round(_map_height/2)];
	
	// moving through entire map
	for (var _xx=0;_xx<_map_width; _xx++) {
		for (var _yy=0;_yy<_map_height; _yy++) {
			// checking if in initial seed room
			if (abs(_xx - _center[0]) < round(_start_width / 2) && 
			   abs(_yy - _center[1]) < round(_start_height / 2)) {
				_map[_xx][_yy] = EMPTY;
			} else {
				_map[_xx][_yy] = SOLID;
			}
		} 
	}
	return _map;
}

function dla_gen(_map_width, _map_height, _map, _fill) {
	// new point of not
	var _active = false;
	var _rand_x = 0;
	var _rand_y = 0;
	for(var _i=0; _i<_fill; _i++) {
		
		// get random point
		if _active == false {
			_rand_x = round(random_range(0, _map_width - 1));
			_rand_y = round(random_range(0, _map_height - 1));
			_active = true;
		}
		
		// checking for solid
		if _map[_rand_x][_rand_y] == EMPTY {
			// get random direction
			var _rand_dir = irandom(3);
			var _xx = 0;
			var _yy = 0;
			// setting 4 direction so no diagonal movement
			if _rand_dir == 0 {
				_xx = 0;
				_yy = 1;
			} else if _rand_dir == 1 {
				_xx = 0;
				_yy = -1;
			} else if _rand_dir == 2 {
				_xx = 1;
				_yy = 0;
			} else if _rand_dir == 3 {
				_xx = -1;
				_yy = 0;
			}
			// checking for SOLID
			if _rand_x + _xx >= 0 && _rand_x + _xx < _map_width 
			&& _rand_y + _yy >= 0 && _rand_y + _yy < _map_height {
				if _map[_rand_x + _xx][_rand_y + _yy] == SOLID {
					_map[_rand_x + _xx][_rand_y + _yy] = EMPTY;
					_rand_x = _rand_x + _xx;
					_rand_y = _rand_y + _yy;
				} else {
					_rand_x = _rand_x + _xx;
					_rand_y = _rand_y + _yy;
					_i--;
			
				}
			} else {
				_active = false;
				_i--;
			}
		} else {
			_i--;
			_active = false;
		}
	}
	return _map;
}