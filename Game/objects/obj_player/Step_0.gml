// ========== INICIALIZAÇÕES ==========
var moving = false;
var hspd = 0;

var gp = 0;

// INPUT GAMEPAD
var axis = gamepad_axis_value(gp, gp_axislh);
if (abs(axis) < 0.2) axis = 0;

var gp_right = (axis > 0) || gamepad_button_check(gp, gp_padr);
var gp_left  = (axis < 0) || gamepad_button_check(gp, gp_padl);
global.gp_up    = gamepad_button_check(gp, gp_face1); // A
var gp_run   = gamepad_button_check(gp, gp_face2); // B

// INPUT COMBINADO
var move_right = keyboard_check(vk_right) || gp_right;
var move_left  = keyboard_check(vk_left)  || gp_left;
var run_input  = keyboard_check(vk_shift) || gp_run;

if (global.dialog_active == true) {
    sprite_index = spr_player;
    exit;
}

if (!carrying) {
    if (move_right) {
        moving = true;
        image_xscale = 1;
        if (run_input) {
            sprite_index = spr_player_run;
            image_speed = 3;
            hspd = vel * 2;
        } else {
            sprite_index = spr_player_walk;
            image_speed = 1.4;
            hspd = vel;
        }
    }
    else if (move_left) {
        moving = true;
        image_xscale = -1;
        if (run_input) {
            sprite_index = spr_player_run;
            image_speed = 3;
            hspd = -vel * 2;
        } else {
            sprite_index = spr_player_walk;
            image_speed = 1.4;
            hspd = -vel;
        }
    }
    else {
        moving = false;
        hspd = 0;
    }

    x += hspd;
    if (place_meeting(x, y, obj_floor)) {
        x -= hspd;
        while (!place_meeting(x + sign(hspd), y, obj_floor)) {
            x += sign(hspd);
        }
        hspd = 0;
    }

    if (!place_meeting(x, y + 1, obj_floor)) {
        vspd += vgravity;
        vfloor = false;
    } else {
        vspd = 0;
        vfloor = true;
    }

    if (!place_meeting(x, y + vspd, obj_floor)) {
        y += vspd;
        if ((vspd > 0 || vspd < 0) && !vfloor) {
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

    if (x < 0 || x > room_width || y < 0 || y > room_height) {
        room_restart();
    }
}

else {
    if (move_right) {
        moving = true;
        image_xscale = 1;
        sprite_index = spr_player_carry_walk;
        image_speed = 1.4;
        hspd = vel;
    }
    else if (move_left) {
        moving = true;
        image_xscale = -1;
        sprite_index = spr_player_carry_walk;
        image_speed = 1.4;
        hspd = -vel;
    }
    else {
        moving = false;
        hspd = 0;
        sprite_index = spr_player_carry;
    }

    x += hspd;
    if (place_meeting(x, y, obj_floor)) {
        x -= hspd;
        while (!place_meeting(x + sign(hspd), y, obj_floor)) {
            x += sign(hspd);
        }
        hspd = 0;
    }
}