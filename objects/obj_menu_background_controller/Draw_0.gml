if(!surface_exists(surf))
{
	surf = surface_create(room_width, room_height);	
}

surface_set_target(surf);
draw_clear(c_black);

//gpu_set_blendmode(bm_normal);
draw_sprite_ext(spr_fog_of_war, 0, 0, 0, room_width, room_height, 0, c_grey, 0.4);
//gpu_set_blendmode(bm_normal);

for(var i = 0; i < ds_list_size(star_list); i++)
{
	var star_coord = ds_list_find_value(star_list, i);
	//draw_sprite(spr_big_star, 0, star_coord.xx, star_coord.yy);
	//gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(spr_big_star, 0, star_coord.xx, star_coord.yy, 2, 2, 0, c_white, 0.4);
	//gpu_set_blendmode(bm_normal);
}

with(obj_button)
{
	//gpu_set_blendmode(bm_dest_color);
	draw_sprite(spr_button, 0, x, y);
	//gpu_set_blendmode(bm_normal);
}

surface_reset_target();
draw_surface(surf, 0, 0);