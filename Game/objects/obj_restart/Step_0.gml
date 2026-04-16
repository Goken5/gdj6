if(keyboard_check(vk_space) || gamepad_button_check_pressed(0, gp_face1)){
	clicked = true
	room_goto(Room0)
}
if(clicked){
	instance_destroy();
}