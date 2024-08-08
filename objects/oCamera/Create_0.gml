// camera position
cam_width = camera_get_view_width(view_camera[0]);
cam_height = camera_get_view_height(view_camera[0]);

cam_spd = 0.8;
cam_spd_close = 0.2;
max_trail = 10;
slow_dist = 5;

cam_x = oPlayer.x - cam_width/2;
cam_y = oPlayer.y - cam_height/2;