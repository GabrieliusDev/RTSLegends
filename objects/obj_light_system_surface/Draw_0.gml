if(!surface_exists(surf))
{
	surf = surface_create(room_width, room_height);	
}

surface_set_target(surf);
draw_clear(c_black);

gpu_set_blendmode(bm_add);
draw_sprite_ext(spr_fog_of_war, 0, 0, 0, room_width, room_height, 0, c_white, 0.02);
gpu_set_blendmode(bm_normal);

with(obj_point)
{
	if(owner == obj_player.playerId)
	{
		gpu_set_blendmode(bm_subtract);
		//draw_circle_color(x,y, 200, c_red, c_black, false);
		/*gpu_set_blendmode(bm_add);
		var range = irandom_range(0.4, 0.6);
		draw_set_alpha(lerp());
		draw_circle_color(x,y, 200, c_red, c_black, false);
		draw_set_alpha(1);*/
		draw_sprite_ext(spr_fog_of_war_zone, 0, x, y, 3, 3, 0, c_yellow, 1);
		gpu_set_blendmode(bm_normal);
	}
}

with(obj_point_server)
{
	if(owner == obj_player.playerId)
	{
		gpu_set_blendmode(bm_subtract);
		//draw_circle_color(x,y, 200, c_red, c_black, false);
		draw_sprite_ext(spr_fog_of_war_zone, 0, x, y, 3, 3, 0, c_yellow, 1);
		gpu_set_blendmode(bm_normal);
	}
}

surface_reset_target();
draw_surface(surf, 0, 0);