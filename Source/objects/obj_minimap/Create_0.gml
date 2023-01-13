surfMinimapBg = -1;
surfMinimapEntities = -1;
scale = 15;
w = room_width/scale;
h = room_height/scale;
x = 15;
y = view_hport[0] - h - 15;

function RefreshMapBG()
{
	surfMinimapBg = surface_create(w, h);
	var _surfTemp = surface_create(room_width, room_height);
	surface_set_target(_surfTemp);
		draw_clear(c_black);
		draw_tilemap(layer_tilemap_get_id(layer_get_id("Tiles")), 0, 0);
	surface_reset_target();
	surface_set_target(surfMinimapBg);
		draw_surface_stretched(_surfTemp, 0, 0, w, h);
	surface_reset_target();
	surface_free(_surfTemp);
}

RefreshMapBG();