var near = place_meeting(x, y, obj_player);
if (obj_player.filter_full){
    image_index = 1;
} else {
    image_index = 0;
	if(obj_player.carrying == true){
		if (near && keyboard_check_pressed(vk_up) || near && global.gp_up) {
			obj_player.filter_full = true;
			obj_player.carrying = false;
		}
	}
    
}
