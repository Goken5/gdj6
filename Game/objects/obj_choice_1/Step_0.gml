var gp = 0;

var left_pressed  = keyboard_check_pressed(vk_left)  || gamepad_button_check_pressed(gp, gp_face3); // X
var right_pressed = keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(gp, gp_face2); // B

if (left_pressed) {
    if (choice == 0) {
        show_debug_message("Escolheu ficar");
        global.dialog_active = false;
        obj_boss.talked = true;
        room_goto(Room4_1);
		instance_destroy(obj_boss);
    } else {
        choice = 0;
    }
}

if (right_pressed) {
    if (choice == 1) {
        show_debug_message("Escolheu ir pro aniversário");
        global.dialog_active = false;
        obj_boss.talked = true;
        room_goto(Room4_2);
		instance_destroy(obj_boss);
    } else {
        choice = 1;
    }
}