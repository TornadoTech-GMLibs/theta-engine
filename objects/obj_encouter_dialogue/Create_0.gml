event_inherited();

depth = encouter_depth.text;

dialogue_index = 0;
if (!variable_instance_exists(id, "dialogue")) {
	dialogue = [];
}

// The next state we will go to upon completion of the dialogue.
if (!variable_instance_exists(id, "state")) {
	state = encouter_state.selecting;
}

var arena = encouter.arena;
var offset_x = 20;
var offset_y = 10;

text_x = arena.x - arena.base_width / 2 + offset_x;
text_y = arena.y - arena.base_height / 2 + offset_y;
text_max_width = arena.base_width / 2 - offset_x;

typist = scribble_typist();
typist.in(0.5, 0);
typist.sound_per_char(snd_voice_main, 1, 1);
typist.character_delay_add("!", 250);
typist.character_delay_add("?", 250);
typist.character_delay_add(".", 200);
typist.character_delay_add(",", 150);
