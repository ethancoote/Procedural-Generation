// randomizes the random seed
randomize();
map_width = 100;
map_height = 100;

// cellular automata
//cell_map = run_cellular_automata(map_width, map_height, 55, 5, 4, 10);

// diffusion limited aggregation
cell_map = init_map(6, 6, map_width, map_height);
// solid based diffusion
//cell_map = dla_gen_solid(map_width, map_height, cell_map, 2000);
// empy based diffusion
//cell_map = dla_gen_empty(map_width, map_height, cell_map, 1500);

//cell_map = room_gen(map_width, map_height, 6, 6, 30, 30, 15, cell_map);
//cell_map = dla_gen_empty(map_width, map_height, cell_map, 500);
