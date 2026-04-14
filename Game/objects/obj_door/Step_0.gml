if (place_meeting(x, y, obj_player) && keyboard_check_pressed(vk_up)) {
    
    if (room == Room1) {
        room_goto(Room2);
    }
    
}