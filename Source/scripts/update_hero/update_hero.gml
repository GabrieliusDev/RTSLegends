// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function update_hero(entity = argument0){
	switch(entity.eType)
	{
		case entityType.hero_warrior:
			server_buffer = con_server.server_buffer;
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.updated_hero);
			buffer_write(server_buffer, buffer_u8, entityType.hero_warrior);
			buffer_write(server_buffer, buffer_u32, current_time - global.TimeOnStart);
			buffer_write(server_buffer, buffer_u16, entity.objectId);
			buffer_write(server_buffer, buffer_u16, entity.x);
			buffer_write(server_buffer, buffer_u16, entity.y);
			buffer_write(server_buffer, buffer_u16, entity.moveX);
			buffer_write(server_buffer, buffer_u16, entity.moveY);
			buffer_write(server_buffer, buffer_u16, entity.hp);			
			buffer_write(server_buffer, buffer_bool, entity.inCombat);
			buffer_write(server_buffer, buffer_u8, entity.morale);
			buffer_write(server_buffer, buffer_u8, entity.boredom);
			buffer_write(server_buffer, buffer_bool, entity.motivated);
	
			//Guarding target
			buffer_write(server_buffer, buffer_bool, entity.guarding != undefined);
			if(entity.guarding != undefined)
				buffer_write(server_buffer, buffer_u8, entity.guarding.objectId);
			else
				buffer_write(server_buffer, buffer_u8, 0);
				
			//Attacking target
			buffer_write(server_buffer, buffer_bool, entity.attacking != undefined);
			if(entity.attacking != undefined)
				buffer_write(server_buffer, buffer_u8, entity.attacking.objectId);
			else
				buffer_write(server_buffer, buffer_u8, 0);
				
			//Capturing target
			buffer_write(server_buffer, buffer_bool, entity.pointToCapture != undefined);
			if(entity.pointToCapture != undefined)
				buffer_write(server_buffer, buffer_u8, entity.pointToCapture.objectId);
			else
				buffer_write(server_buffer, buffer_u8, 0);
		
		
			send_data_to_all_players(server_buffer);
		break;
	}	
}