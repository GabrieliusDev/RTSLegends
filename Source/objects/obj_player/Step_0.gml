/// @description Insert description here
// You can write your code in this editor

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