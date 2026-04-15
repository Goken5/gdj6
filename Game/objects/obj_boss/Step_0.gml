if(obj_player.filter_full == true){
	var near = place_meeting(x, y, obj_player);

	if (near && keyboard_check_pressed(vk_up)) {
	    global.dialog_active = true;
		instance_create_layer(0, 0, "GUI", obj_choice);
		show_debug_message("ta rodando")
	}
	
}