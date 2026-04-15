var moving = false;
var hspd = 0;
if(global.dialog_active == true){
	sprite_index = spr_player;
	exit;
}

if(!carrying){
	
	if(keyboard_check(vk_right)) {
	    moving = true;
	    image_xscale = 1;
    
	    if(keyboard_check(vk_shift)) {
	        sprite_index = spr_player_run;
			image_speed = 3;
			hspd = vel*2;
		} else {
			sprite_index = spr_player_walk;
			image_speed = 1.4;
			hspd = vel;
		}
	}

	if(keyboard_check(vk_left)) {
		moving = true;
		image_xscale = -1;
    
		if(keyboard_check(vk_shift)) {
			sprite_index = spr_player_run;
			image_speed = 3;
			hspd = -vel*2; 
		} else {
			sprite_index = spr_player_walk;
			image_speed = 1.4;
			hspd = -vel;
		}
	}

	if (place_meeting(x + hspd, y, obj_floor)) {
	
		while (!place_meeting(x + sign(hspd), y, obj_floor)) {
			x += sign(hspd);
		}
		hspd = 0;
	}

	x += hspd;

// GRAVIDADE E PULO
	if (!place_meeting(x, y + 1, obj_floor)) {
		vspd += vgravity;
		vfloor = false;
	} else {
		vspd = 0;
		vfloor = true;
	}

//Tinha pulo aqui, caso precise, dá ctrl z

	if (!place_meeting(x, y + vspd, obj_floor)) {
		y += vspd;
    
		if (vspd > 0 && !vfloor) {
			//player_fall q apaguei
			image_speed = 1;
		}
		else if (vspd < 0 && !vfloor) {
			//player_jump q apaguei
			image_speed = 1;
		}
	} else {
		while (!place_meeting(x, y + sign(vspd), obj_floor)) {
			y += sign(vspd);
		}
		vspd = 0;
    
		if (!moving) {
			sprite_index = spr_player;
		}
	}

	if (vfloor && !moving) {
		image_speed = 0.7;
		sprite_index = spr_player;
	}

	if (obj_player.x < 0 || obj_player.x > room_width || obj_player.y < 0 || obj_player.y > room_height) {
		room_restart();
	}

}
else if(carrying){
	if(keyboard_check(vk_right)) {
	    moving = true;
	    image_xscale = 1;
		sprite_index = spr_player_carry_walk;
		image_speed = 1.4;
		hspd = vel;
	}

	if(keyboard_check(vk_left)) {
		moving = true;
		image_xscale = -1;
		sprite_index = spr_player_carry_walk;
		image_speed = 1.4;
		hspd = -vel;
	}
	if(!moving){
		sprite_index = spr_player_carry;
	}
	
	if (place_meeting(x + hspd, y, obj_floor)) {
	
		while (!place_meeting(x + sign(hspd), y, obj_floor)) {
			x += sign(hspd);
		}
		hspd = 0;
	}

	x += hspd;
}
