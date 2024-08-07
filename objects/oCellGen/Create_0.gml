// randomizes the random seed
randomize();
map_width = 76;
map_height = 76;

// cellular automata
//cell_map = run_cellular_automata(map_width, map_height, 55, 5, 4, 10);

// diffusion limited aggregation
cell_map = init_map(6, 6, map_width, map_height);
cell_map = dla_gen(map_width, map_height, cell_map, 1000);

