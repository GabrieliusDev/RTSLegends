/// @description Insert description here
// You can write your code in this editor

popUpTexts = ds_list_create();
ds_list_add(popUpTexts, "POW!")
ds_list_add(popUpTexts, "umf!")
ds_list_add(popUpTexts, "ergh!")
ds_list_add(popUpTexts, "HIT!")
text_index = random(ds_list_size(popUpTexts))
angle = random_range(-45,45);

info = "";
alpha = 1;
disolve_speed = room_speed*0.5

alarm[0] = disolve_speed;