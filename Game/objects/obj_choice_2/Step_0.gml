if (keyboard_check_pressed(vk_left)) {
    if (choice == 0) {
        show_debug_message("Escolheu ficar");
        global.dialog_active = false;
        obj_thegoat.talked = true;
        instance_destroy();
    } else {
        choice = 0;
    }
}

if (keyboard_check_pressed(vk_right)) {
    if (choice == 1) {
        show_debug_message("Escolheu ir");
        global.dialog_active = false;
        obj_thegoat.talked = true;
        instance_destroy();
    } else {
        choice = 1;
    }
}
