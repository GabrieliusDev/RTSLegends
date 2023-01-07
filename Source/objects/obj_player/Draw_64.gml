var pos = 2;
draw_text(100, 20, "size: " + string(ds_map_size(global.CombatEntities)));
for (var k = ds_map_find_first(global.CombatEntities); !is_undefined(k); k = ds_map_find_next(global.CombatEntities, k)) {
	var entity = global.CombatEntities[? k];
	if(entity != undefined){
		draw_text(100, 20*pos, string(entity.objectId) + " " + string(entity));
		pos++;
	}
}

var time = floor((current_time-timeOnStart)/1000);
var minutes = floor(time/60);
var seconds = time%60;

var mString = "0";
if(minutes >= 10)
	mString = "";
mString += string(minutes);
var sString = "0";
if(seconds >= 10)
	sString = "";
sString += string(seconds);

draw_text(view_wport[0]-300, 10, "Time: " + mString + ":" + sString);

if(global.game_started)
{
	/*draw_set_color(c_gray);
	draw_rectangle(left_top_x, left_top_y, right_bot_x, right_bot_y, false);
	draw_set_color(c_black);
	draw_rectangle(left_top_x+2, left_top_y+2, right_bot_x-2, right_bot_y, true);*/
	draw_sprite(spr_gui_button_background, 0, left_top_x, left_top_y);

	for(var i = 0; i < buttons_count; i++)
	{
			draw_set_color(make_color_rgb(105, 48, 195));
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);	
			var size = button_size/2;
			switch(i)
			{
				case gui_button_types.outpost:
					draw_sprite(spr_btn_point_outpost_temp, 0, posx + spacing*i, posy);				
					draw_text(posx + spacing*i+size, posy+size, ds_map_find_value(global.prices, types.outpost));
					break;
				case gui_button_types.barracks:
					draw_sprite(spr_btn_point_barracks_temp, 0, posx + spacing*i, posy);
					draw_text(posx + spacing*i+size, posy+size, ds_map_find_value(global.prices, types.barracks));
					break;
				case gui_button_types.tower:
					draw_sprite(spr_btn_point_tower_temp, 0, posx + spacing*i, posy);
					draw_text(posx + spacing*i+size, posy+size, ds_map_find_value(global.prices, types.tower));
					break;
				case gui_button_types.gatherer:
					draw_sprite(spr_btn_point_gatherer_temp, 0, posx + spacing*i, posy);					
					draw_text(posx + spacing*i+size, posy+size, ds_map_find_value(global.prices, types.gatherer));
					break;
			}	
	}

	//Debug info
	draw_set_color(c_white);
	draw_text(50,10, string(x) + ", " + string(y));
		
	//Energy background
	/*draw_set_color(c_dkgray);
	var energy_box_width = 200/2;
	var energy_box_height = 24;
	draw_rectangle(view_wport[0]/2-energy_box_width, view_hport[0]-energy_box_height, view_wport[0]/2+energy_box_width, view_hport[0], false);
	draw_set_color(c_black);
	draw_rectangle(view_wport[0]/2-energy_box_width+2, view_hport[0]-energy_box_height+2, view_wport[0]/2+energy_box_width-2, view_hport[0], true);
	*/
	//Energy text
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);	
	draw_set_color(make_color_rgb(128,255,219));
	draw_text(view_wport[0]/2, view_hport[0]-10, string(global.energy) + "E");
}