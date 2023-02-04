/// @description Insert description here
// You can write your code in this editor

//if(playerId == obj_player.playerId)
	draw_self();

draw_text(x, y, instance_exists(target));

if(playerId != undefined)
{
	draw_set_alpha(0.2);
	switch(playerId)
	{
		case 1:
			image_blend = c_aqua;
			//image_xscale = scale;
			//draw_rectangle_color(x-16, y-16, x+16, y+16, c_aqua, c_aqua, c_aqua, c_aqua, false);
		break;
		
		case 2:
			image_blend = c_orange;
			//image_xscale = -scale;
			//draw_rectangle_color(x-16, y-16, x+16, y+16, c_red, c_red, c_red, c_red, false);
		break;
	}
	draw_set_alpha(1);
}