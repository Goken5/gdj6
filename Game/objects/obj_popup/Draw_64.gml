if (timer > 0) {

    var gw = display_get_gui_width();

    var margin = 30;
    var x_ = gw - margin;
    var y_ = margin;

    var alpha = timer / duration;

    draw_set_halign(fa_right);
    draw_set_valign(fa_top);

    // sombra
    draw_set_alpha(alpha * 0.5);
    draw_set_color(c_black);
    draw_text(x_ + 2, y_ + 2, text);

    // texto principal
    draw_set_alpha(alpha);
    draw_set_color(c_white);
    draw_text(x_, y_, text);

    draw_set_alpha(1);
}