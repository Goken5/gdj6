event_inherited();

options = ["Sair com ele", "Ir dormir"];
choice = -1;

left_action = function() {
	popup_show("Seu nível de Vivência aumentou")
    global.dialog_active = false;
    obj_dog.talked = true;
    instance_destroy();
	room_goto(End_2);
}

right_action = function() {
	show_debug_message("Seu nível de Sobrevivência aumentou");
    global.dialog_active = false;
    obj_dog.talked = true;
    instance_destroy();
	room_goto(BadEnd_1)
}