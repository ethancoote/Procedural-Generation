
// randomizes the random seed
randomize();
map_width = 90;
map_height = 90;

rel_player_pos = [0,0];
x_offset = 10;
y_offset = 350;
cor = 2;


// cellular automata
//cell_map = run_cellular_automata(map_width, map_height, 55, 5, 4, 10);

// diffusion limited aggregation
cell_map = init_map(6, 6, map_width, map_height);
// solid based diffusion
cell_map = dla_gen_solid(map_width, map_height, cell_map, 2000);
// empy based diffusion
//cell_map = dla_gen_empty(map_width, map_height, cell_map, 1500);

//cell_map = room_gen(map_width, map_height, 6, 6, 30, 30, 15, cell_map);
//cell_map = dla_gen_empty(map_width, map_height, cell_map, 500);

// adding pizes
cell_map = set_prizes(cell_map, map_width, map_height);

// create tilemap
global.ground_layer = layer_create(1);
global.ground_tilemap = layer_tilemap_create(global.ground_layer, 0, 0, tsTiles, room_width, room_height);
global.wall_tilemap = layer_tilemap_create(global.ground_layer, 0, 0, tsTiles, room_width, room_height);

for(i=0; i<map_width;i++) {
	for(j=0; j<map_height; j++) {
		if cell_map[i][j] == SOLID {
			tilemap_set_at_pixel(global.wall_tilemap, 3, i*16, j*16);
		} else if cell_map[i][j] == EMPTY {
			tilemap_set_at_pixel(global.ground_tilemap, 1, i*16, j*16);
		} else if cell_map[i][j] == PRIZE {
			tilemap_set_at_pixel(global.ground_tilemap, 1, i*16, j*16);
			var _inst = instance_create_depth(i*16, j*16, -1, oPrize1);
			with (_inst) {
				image_index = irandom(7);
			}
		}
	}
}
