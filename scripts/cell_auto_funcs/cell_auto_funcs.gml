// Script assets have changed for v2.3.0 see

#macro CELLSIZE 2
#macro EMPTY 0
#macro SOLID 1
#macro PRIZE 2

// init and randomize map
function randomize_map(_spawn_chance, _map_width, _map_height) {
	var _map;
	for (var _xx=0; _xx<_map_width; _xx++) {
		for (var _yy=0; _yy<_map_height; _yy++) {
			var _roll = random_range(0, 100) {
				if _roll <= _spawn_chance {
					_map[_xx][_yy] = SOLID;
				} else {
					_map[_xx][_yy] = EMPTY;
				}
			}
		}
	}
	return _map;
}

// count neighbours for game of life
function count_neighbours(_x, _y, _map, _map_width, _map_height) {
	var _count = 0; // counting neighbours
	for (var _dx=-1; _dx<2; _dx++) {
		for (var _dy=-1; _dy<2; _dy++) {
			var _xx = _dx + _x;
			var _yy = _dy + _y;
			if (_xx <= 0 || _yy <= 0 || _xx >= _map_width - 1 || _yy >= _map_height - 1) {
				_count++;
			} else if (_dx == 0 && _dy == 0) {
				continue;
			} else {
				if _map[_xx][_yy] == SOLID {
					_count++
				}
			}
		}
	}
	return _count;
}

// simulate iterations for game of life
function iterations(_old_map, _create_limit, _destroy_limit, _map_width, _map_height) {
	var _new_map = [];
	for (var _xx=0; _xx<_map_width; _xx++) {
		for (var _yy=0; _yy<_map_height; _yy++) {
			var _count = count_neighbours(_xx, _yy, _old_map, _map_width, _map_height);
			if _old_map[_xx][_yy] == SOLID {
				if _count < _destroy_limit {
					_new_map[_xx][_yy] = EMPTY;
				} else {
					_new_map[_xx][_yy] = SOLID;
				}
			} else {
				if _count > _create_limit {
					_new_map[_xx][_yy] = SOLID;
				} else {
					_new_map[_xx][_yy] = EMPTY;
				}
			}
		}
	}
	return _new_map;
}

// run the full cellular automata for set # of iterations
function run_cellular_automata(_map_width, _map_height, _spawn_chance, _create_limit, _destroy_limit, _iterations) {
	var _map;
	
	_map = randomize_map(_spawn_chance, _map_width, _map_height);
	
	for (var _i=0; _i<_iterations; _i++) {
		_map = iterations(_map, _create_limit, _destroy_limit, _map_width, _map_height);
	}
	
	return _map;
}

// draws the map to the screen
function draw_map(_map, _x, _y, _map_width, _map_height) {
	for (var _xx=0; _xx<_map_width; _xx++) {
		for (var _yy=0; _yy<_map_height; _yy++) {
			var _x1 = _x + _xx*CELLSIZE;
			var _y1 = _y + _yy*CELLSIZE;
			var _x2 = _x1 + CELLSIZE;
			var _y2 = _y1 + CELLSIZE;
			
			if _map[_xx][_yy] == SOLID {
				draw_set_color(c_white);
				draw_set_alpha(0.3);
			} else {
				draw_set_color(c_gray);
				draw_set_alpha(0.3);
			}
			draw_rectangle(_x1, _y1, _x2, _y2, false);
		}
	}
}