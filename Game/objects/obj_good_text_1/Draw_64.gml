// --- MENSAGENS ---
var t1 = "Você lembrou que, para viver, é necessário sobreviver, então você foi para casa e descansou para mais um dia de trabalho.";
var t2 = "Use as setas para se mover";
var t3 = "Evite perigos pelo caminho";

// --- CONFIG INICIAL ---
if (finished) exit;

// controle
var has_gamepad = gamepad_is_connected(0);

// --- FUNÇÕES ---
var draw_key = function(_spr, _frame, _x, _y, _rot, _alpha) {
    var sw = sprite_get_width(_spr) * esc_s;
    draw_sprite_ext(_spr, _frame, _x + (sw * 0.5), _y, esc_s, esc_s, _rot, c_white, _alpha);
};

var draw_text_shadow = function(_x, _y, _text, _scale, _alpha, _off) {
    draw_set_color(c_black);
    draw_set_alpha(_alpha * 0.5);
    draw_text_transformed(_x + _off, _y + _off, _text, _scale, _scale, 0);

    draw_set_color(c_white);
    draw_set_alpha(_alpha);
    draw_text_transformed(_x, _y, _text, _scale, _scale, 0);
};

// --- CONFIG DRAW ---
draw_set_font(font);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var pos_x = gui_w / 2;
var pos_y = gui_h / 4;

var _a = atual_alpha;

// --- CALCULA TAMANHOS ---
var w1 = string_width(t1);
var w2 = string_width(t2);
var w3 = string_width(t3);
var w_key = sprite_get_width(spr_arrows) * esc_s;

// largura total
var total = w1 + gap + w_key + gap + w2 + gap + w_key + gap + w3;

// posição inicial centralizada
var xx = pos_x - (total * 0.5);

// --- DRAW ---
if (atual_index == 0) {

    draw_text_shadow(xx, pos_y, t1, esc_t, _a, off);
    xx += w1 + gap;

    draw_key(spr_arrows, 0, xx, pos_y, 90, _a);
    xx += w_key + gap;

    draw_text_shadow(xx, pos_y, t2, esc_t, _a, off);
    xx += w2 + gap;

    draw_key(spr_arrows, 0, xx, pos_y, 270, _a);
    xx += w_key + gap;

    draw_text_shadow(xx, pos_y, t3, esc_t, _a, off);
}

// reset alpha
draw_set_alpha(1);