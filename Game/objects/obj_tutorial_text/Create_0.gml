// mensagens
messages[0] = "Aperte ← e → para andar";
messages[1] = "Aperte Shift para correr";

// index e animação
atual_index = 0;
atual_alpha = 0; // Começa em 0 para fazer o fade in inicial
alpha_target = 1;
fade_speed = 0.05;

// timer
tutorial_timer = 0;
tutorial_cooldown = 180;

// flag de fim
finished = false;

// fonte e escalas
font = fnt_tutorial;
esc_t = 1.5;   // escala do texto
esc_s = 0.8;   // escala dos ícones
gap   = 12;    // espaço entre blocos
off   = 2;     // deslocamento da sombra