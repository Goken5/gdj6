function popup_show(_text) {
    if (!instance_exists(obj_popup)) {
        instance_create_depth(0, 0, -10000, obj_popup);
    }

    with (obj_popup) {
        text = _text;
        timer = duration;
    }
}