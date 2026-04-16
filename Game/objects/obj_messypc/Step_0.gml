var near = place_meeting(x, y, obj_player);

if (full) {
    image_index = 0;
} else {
    image_index = 1;
    
    if (near && keyboard_check_pressed(vk_up) || near && global.gp_up) {
        full = true;
    }
}