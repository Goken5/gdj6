var gp = 0;

var left_pressed  = keyboard_check_pressed(vk_left)  || gamepad_button_check_pressed(gp, gp_face3); // X
var right_pressed = keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(gp, gp_face2); // B



if (left_pressed) {
    if (choice == 0) {
        left_action();
    } else {
        choice = 0;
    }
}

if (right_pressed) {
    if (choice == 1) {
        right_action();
    } else {
        choice = 1;
    }
}