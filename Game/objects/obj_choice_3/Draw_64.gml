var gw = display_get_gui_width();
var gh = display_get_gui_height();
var cx = gw / 2;

var t = current_time * 0.005;
var pulse = 0.5 + 0.5 * sin(t);

// 🎮 detectar controle
var has_gamepad = gamepad_is_connected(0);

// fundo
draw_set_alpha(0.7);
draw_set_color(make_color_rgb(20,20,20));
draw_rectangle(0, 0, gw, gh, false);
draw_set_alpha(1);

// lados base (cinza)
draw_set_alpha(0.25);
draw_set_color(make_color_rgb(80,80,80));
draw_rectangle(0, 0, cx, gh, false);

draw_set_color(make_color_rgb(60,60,60));
draw_rectangle(cx, 0, gw, gh, false);
draw_set_alpha(1);

// highlight suave
draw_set_alpha(0.2 + pulse * 0.2);

if (choice == 0) {
    draw_set_color(make_color_rgb(120,120,140));
    draw_rectangle(0, 0, cx, gh, false);
} else {
    draw_set_color(make_color_rgb(120,140,160));
    draw_rectangle(cx, 0, gw, gh, false);
}

draw_set_alpha(1);

// linha central
draw_set_alpha(0.3);
draw_set_color(c_white);
draw_line(cx, 0, cx, gh);
draw_set_alpha(1);

// texto
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(cx, gh * 0.2, "Você está exausto, mas seu cachorro quer passear");

// zoom leve
var scale_l = (choice == 0) ? 1 + pulse * 0.05 : 1;
var scale_r = (choice == 1) ? 1 + pulse * 0.05 : 1;

draw_text_transformed(cx / 2, gh / 2, "Passear com ele", scale_l, scale_l, 0);
draw_text_transformed(cx + cx / 2, gh / 2, "Ir Dormir", scale_r, scale_r, 0);


// =================== SETAS SEMPRE VISÍVEIS ===================

// alpha quando não selecionada
var alpha_idle = 0.25;

// escala idle
var scale_idle = 1;

// SELECIONADA → pulse suave
var scale_active = 1 + pulse * 0.15;

// LEFT
var a_l = (choice == 0) ? 1 : alpha_idle;
var s_l = (choice == 0) ? scale_active : scale_idle;

// RIGHT
var a_r = (choice == 1) ? 1 : alpha_idle;
var s_r = (choice == 1) ? scale_active : scale_idle;


// ---- desenhar seta esquerda ----
draw_set_alpha(a_l);

if (has_gamepad) {
    draw_sprite_ext(spr_buttons, 2, cx / 2, gh * 0.75, s_l, s_l, 0, c_white, 1); // X
} else {
    draw_sprite_ext(spr_arrows, 0, cx / 2, gh * 0.75, s_l, s_l, 90, c_white, 1);
}


// ---- desenhar seta direita ----
draw_set_alpha(a_r);

if (has_gamepad) {
    draw_sprite_ext(spr_buttons, 1, cx + cx / 2, gh * 0.75, s_r, s_r, 0, c_white, 1); // B
} else {
    draw_sprite_ext(spr_arrows, 0, cx + cx / 2, gh * 0.75, s_r, s_r, 270, c_white, 1);
}

draw_set_alpha(1);