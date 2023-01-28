/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(alpha);
draw_set_font(fnt_pop_up);
draw_set_halign(fa_center);

//draw_text_transformed(x, y, ds_list_find_value(popUpTexts, text_index), 1, 1, angle);
//draw_text_transformed(x, y, info, 1, 1, angle);
//draw_text(x, y, ds_list_find_value(popUpTexts, text_index));
draw_text(x, y, info);


draw_set_font(fnt_main);
draw_set_alpha(1);

alpha -= 1/disolve_speed;
y-=alpha*2;