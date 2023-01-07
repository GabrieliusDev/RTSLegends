depth = 10;
surf = surface_create(room_width, room_height);

surface_set_target(surf);

//draw_clear(c_black);

surface_reset_target();

//init stars
randomize();

star_list = ds_list_create();
var amount = irandom_range(10,20);
for(var i = 0; i < amount; i++)
{
	ds_list_add(star_list, { 
		xx: irandom_range(0, room_width), 
		yy: irandom_range(0, room_height)
	});	
}