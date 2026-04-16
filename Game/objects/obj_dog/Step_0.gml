if(room == Room5){
	image_index = 1;
	var near = place_meeting(x, y, obj_player);

	if (near && (keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_face1))) {
	    global.dialog_active = true;
		instance_create_layer(0, 0, "GUI", obj_choice_3);
	}
}
if(room == Room1){
	image_index = 0;
}
