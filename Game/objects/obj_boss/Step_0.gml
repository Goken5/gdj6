if(obj_filter.full == true){
	var near = place_meeting(x, y, obj_player);

	if (near && keyboard_check_pressed(vk_up)) {
	    global.dialog_active = true;
		instance_create_layer(x, y, "GUI", obj_choice);
	}
}