var gp = 0;

var left_pressed  = keyboard_check_pressed(vk_left)  || gamepad_button_check_pressed(gp, gp_face3); // X
var right_pressed = keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(gp, gp_face2); // B



if (left_pressed) {
    if (choice == 0) {
        show_debug_message("Escolheu sair");
        global.dialog_active = false;
        obj_dog.talked = true;
        instance_destroy();
		room_goto(End_2);
    } else {
        choice = 0;
    }
}

if (right_pressed) {
    if (choice == 1) {
        show_debug_message("Escolheu dormir");
        global.dialog_active = false;
        obj_dog.talked = true;
        instance_destroy();
		room_goto(BadEnd_1)
    } else {
        choice = 1;
    }
}
