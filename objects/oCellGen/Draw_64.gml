draw_map(cell_map, x_offset, y_offset, map_width, map_height);

// draw player on map
draw_set_color(c_blue);
draw_set_alpha(1);
draw_rectangle(rel_player_pos[0]+x_offset-cor, rel_player_pos[1]+y_offset-cor, 
			   rel_player_pos[0]+4+x_offset-cor, rel_player_pos[1]+4+ y_offset-cor, false);
