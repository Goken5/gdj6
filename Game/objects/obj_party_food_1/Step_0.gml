var near = place_meeting(x, y, obj_player);

if (!exist) {
    image_index = 1;
} else {
    image_index = 0;  
    if (near && keyboard_check_pressed(vk_up)) {
        exist = false;
    }
}