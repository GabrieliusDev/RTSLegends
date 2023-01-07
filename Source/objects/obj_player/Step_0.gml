closest_point = noone;
closest_enemy_point = noone;
tower_in_range = noone;
distance = global.movement_range +1;
distance_to_enemy = global.movement_range +1;

///Movement
if(keyboard_check(ord("W")) || keyboard_check(vk_up))
{
	if(y - camera_speed >= h_half)
		y -= camera_speed;
}
if (keyboard_check(ord("A")) || keyboard_check(vk_left))
{
	if(x - camera_speed >= w_half)
		x -= camera_speed;	
}
if (keyboard_check(ord("S")) || keyboard_check(vk_down))
{
	if(y + camera_speed <= room_height - h_half)
		y += camera_speed;
}
if (keyboard_check(ord("D")) || keyboard_check(vk_right))
{
	if(x + camera_speed <= room_width - w_half)
		x += camera_speed;
}

//Gui building keyboard press
if(keyboard_check_pressed(ord("1"))){
	building_mode = true;
	building = gui_button_types.outpost;	
}else if(keyboard_check_pressed(ord("2"))){
	building_mode = true;
	building = gui_button_types.barracks;	
}else if(keyboard_check_pressed(ord("3"))){
	building_mode = true;
	building = gui_button_types.tower;	
}else if(keyboard_check_pressed(ord("4"))){
	building_mode = true;
	building = gui_button_types.gatherer;	
}