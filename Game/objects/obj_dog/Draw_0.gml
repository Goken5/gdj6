draw_self();

if(room == Room5){

	var offset = sin(current_time / 200) * 5;
    var has_gamepad = gamepad_is_connected(0);

    if (has_gamepad) {
        draw_sprite_ext(
            spr_buttons,
            0, // frame 0 = A
            x,
            y - 100 + offset,
            0.7,
            0.7,
            0,
            c_white,
            1
        );
    } else {
        draw_sprite_ext(
            spr_arrows,
            0,
            x,
            y - 100 + offset,
            0.7,
            0.7,
            0,
            c_white,
            1
        );
    }
}