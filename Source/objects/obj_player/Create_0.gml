playerId = undefined;
isHost = false;

p_parent = undefined;
p_attacking = undefined;

show_range_zone = false;
global.movement_range = 300;
global.game_started = false;

//Resources
global.energy = 100;

//GUI
w_offset = 40;
h_offset = 100;

button_size = 64;
spacing = button_size + 14;

w_size = (spacing * 4 + 16) / 2;
h_size = 120;

left_top_x = view_wport[0]/2 - w_size;
left_top_y = view_hport[0] - h_size;

right_bot_x = view_wport[0]/2+w_size;
right_bot_y = view_hport[0];

posx = left_top_x + 18;
posy = left_top_y + 16;

buttons_count = 4;

button_pressed = false;
building_mode = false;
can_build = false;

mouse_over = gui_button_types.nothing;
building = gui_button_types.nothing;

closest_point = noone;
distance = global.movement_range +1;

///Camera movement
w_half = view_wport[0] / 2;
h_half = view_hport[0] / 2;
x = w_half;
y = h_half
camera_speed = camera_get_view_speed_x(view_camera[0]);