event_inherited();

// Methods

/// @param {Function} callback
/// @return {Function}
invoke_after_destroy = function(callback) {
	return on_destroy.connect(callback);
}

// Events
on_destroy = new Event();

// Typist
typist = scribble_typist();
typist.in(0.5, 0);
typist.sound_per_char(snd_voice_main, 1, 1);
typist.character_delay_add("!", 250);
typist.character_delay_add("?", 250);
typist.character_delay_add(".", 200);
typist.character_delay_add(",", 150);

// Dialouge
dialogue_index = 0;

if (!variable_instance_exists(id, "dialogue")) {
	dialogue = ["[c_red]ОШИБКА ЗАГРУЗКИ ДИАЛОГА"];
}
