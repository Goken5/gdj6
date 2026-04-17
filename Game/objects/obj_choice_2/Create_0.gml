event_inherited()

options = ["Ficar até mais tarde", "Ir embora"];
choice = -1;

left_action = function(){
	if (choice == 0) {

    popup_show("Seu nível de Sobrevivência aumentou");

    global.dialog_active = false;
    obj_thegoat.talked = true;

    instance_destroy();
    room_goto(BadEnd_2);

    } else {
        choice = 0;
    }
}

right_action = function(){
	if (choice == 1) {

    popup_show("Seu nível de Vivência aumentou");

    global.dialog_active = false;
    obj_thegoat.talked = true;

    instance_destroy();
    room_goto(End_1);

    } else {
        choice = 1;
    }
}