event_inherited()

options = ["Ficar até mais tarde", "Ir ao aniversário do seu amigo"];
choice = -1;

gp = 0;

left_action = function(){
	if (choice == 0) {

    popup_show("Seu nível de Sobrevivência aumentou");

    global.dialog_active = false;
    obj_boss.talked = true;

    room_goto(Room4_1);
    instance_destroy(obj_boss);

	}
}
right_action = function(){
	if (choice == 1) {

    popup_show("Seu nível de Vivência aumentou");

    global.dialog_active = false;
    obj_boss.talked = true;

    room_goto(Room4_2);
    instance_destroy(obj_boss);

    } else {
        choice = 1;
    }

}
