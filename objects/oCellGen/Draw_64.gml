draw_map(cell_map, offset, offset, map_width, map_height);

// draw player on map
draw_set_color(c_blue);
draw_rectangle(rel_player_pos[0]+offset-cor, rel_player_pos[1]+offset-cor, 
			   rel_player_pos[0]+4+offset-cor, rel_player_pos[1]+4+ offset-cor, false);
