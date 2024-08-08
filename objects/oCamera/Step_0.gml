
ideal_pos[0] = oPlayer.x - cam_width/2;
ideal_pos[1] = oPlayer.y - cam_height/2;


// follow the player
if cam_x < ideal_pos[0] {
	if abs(cam_x - ideal_pos[0]) < slow_dist {
		cam_x += cam_spd_close;
	} else {
		cam_x += cam_spd;
	}
	if cam_x > ideal_pos[0] {
		cam_x = ideal_pos[0];
	}
	if abs(cam_x - ideal_pos[0]) > max_trail {
		cam_x = ideal_pos[0] - max_trail;
	} 
} else if cam_x > ideal_pos[0] {
	if abs(cam_x - ideal_pos[0]) < slow_dist {
		cam_x -= cam_spd_close;
	} else {
		cam_x -= cam_spd;
	}
	
	if cam_x < ideal_pos[0] {
		cam_x = ideal_pos[0];
	}
	
	if abs(cam_x - ideal_pos[0]) > max_trail {
		cam_x = ideal_pos[0] + max_trail;
	} 
}

if cam_y < ideal_pos[1] {
	if abs(cam_y - ideal_pos[1]) < slow_dist {
		cam_y += cam_spd_close;
	} else {
		cam_y += cam_spd;
	}
	if cam_y > ideal_pos[1] {
		cam_y = ideal_pos[1];
	}
	if abs(cam_y - ideal_pos[1]) > max_trail{
		cam_y = ideal_pos[1] - max_trail;
	} 
} else if cam_y > ideal_pos[1] {
	if abs(cam_y - ideal_pos[1]) < slow_dist {
		cam_y -= cam_spd_close;
	} else {
		cam_y -= cam_spd;
	}
	
	if cam_y < ideal_pos[1] {
		cam_y = ideal_pos[1];
	}
	
	if abs(cam_y - ideal_pos[1]) > max_trail {
		cam_y = ideal_pos[1] + max_trail;
	} 
}

camera_set_view_pos(view_camera[0], cam_x, cam_y);
