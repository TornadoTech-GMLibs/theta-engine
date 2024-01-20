dialogue_index = 0;
if (!variable_instance_exists(id, "dialogue")) {
	dialogue = ["[c_red]ОШИБКА ЗАГРУЗКИ ДИАЛОГА"];
}

if (!variable_instance_exists(id, "enemy")) {
	enemy = noone;
}

typist = scribble_typist();
typist.in(0.5, 0);
typist.sound_per_char(enemy.voice, 1, 1);
typist.character_delay_add("!", 250);
typist.character_delay_add("?", 250);
typist.character_delay_add(".", 200);
typist.character_delay_add(",", 150);
