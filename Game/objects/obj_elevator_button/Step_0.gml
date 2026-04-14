var near = place_meeting(x, y, obj_player);

if (near && keyboard_check_pressed(vk_up)) {
    room_goto(Room3);
}
