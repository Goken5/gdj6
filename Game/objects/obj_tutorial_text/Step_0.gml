if (finished) exit;
var gp = 0;
// skip manual (ao apertar a tecla, o target vira 0 pra sumir)
if (atual_index == 0 && (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right)) || (gamepad_button_check(gp, gp_padr) || gamepad_button_check(gp, gp_padl)))
    alpha_target = 0;

if (atual_index == 1 && keyboard_check_pressed(vk_shift))
    alpha_target = 0;


// timer natural
tutorial_timer++;
if (tutorial_timer >= tutorial_cooldown) {
    tutorial_timer = 0;
    alpha_target = 0;
}

// Lógica de Fade e troca de index
if (atual_alpha != alpha_target)
{
    atual_alpha += (alpha_target - atual_alpha) * fade_speed;

    if (abs(alpha_target - atual_alpha) < 0.01)
    {
        atual_alpha = alpha_target;

        // Se terminou de sumir (alpha 0), pula pra próxima mensagem
        if (alpha_target == 0) {
            atual_index++;
            tutorial_timer = 0; // Reseta o tempo para a nova mensagem

            if (atual_index >= array_length(messages)) {
                finished = true;
            } else {
                alpha_target = 1; // Faz a próxima aparecer
            }
        }
    }
}