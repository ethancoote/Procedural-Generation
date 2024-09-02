// camera info
var _cw = camera_get_view_width(view_camera[0]);
var _ch = camera_get_view_height(view_camera[0]);
var _cx = camera_get_view_x(view_camera[0]);
var _cy = camera_get_view_y(view_camera[0]);

// create
if (!surface_exists(surf)) {
	surf = surface_create(_cw, _ch);
}

// init dark
surface_set_target(surf);
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0,0, _cw, _ch, 0);
gpu_set_blendmode(bm_subtract);

// cutting holes
with (oPlayer) {
	
}

// end
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);
surface_reset_target();
draw_surface(surf, _cx, _cy);
