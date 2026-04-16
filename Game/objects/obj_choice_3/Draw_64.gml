var gw = display_get_gui_width();
var gh = display_get_gui_height();
var cx = gw / 2;

var t = current_time * 0.005;
var pulse = 0.5 + 0.5 * sin(t);

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

draw_text(cx, gh * 0.2, "Você está cansado, mas seu cachorro quer sair");

// zoom leve
var scale_l = (choice == 0) ? 1 + pulse * 0.05 : 1;
var scale_r = (choice == 1) ? 1 + pulse * 0.05 : 1;

draw_text_transformed(cx / 2, gh / 2, "Passear com ele", scale_l, scale_l, 0);
draw_text_transformed(cx + cx / 2, gh / 2, "Ir dormir", scale_r, scale_r, 0);

// setas com pulso
var arrow_scale = 1 + pulse * 0.2;

if (choice == 0) {
    draw_sprite_ext(spr_arrows, 0, cx / 2, gh * 0.75, arrow_scale, arrow_scale, 90, c_white, 1);
}

if (choice == 1) {
    draw_sprite_ext(spr_arrows, 0, cx + cx / 2, gh * 0.75, arrow_scale, arrow_scale, 270, c_white, 1);
}