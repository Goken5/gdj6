draw_self();

if(obj_player.carrying = true){
	var offset = sin(current_time / 200) * 5;
    
    draw_sprite_ext(
        spr_arrows,
        0,
        x,
        y - 100 + offset,
        0.7,  // scale X
        0.7,  // scale Y
        0,    // rotação
        c_white,
        1     // alpha
    );
}