event_inherited();

depth = encouter_depth.text;

input = encouter.input;
arena = encouter.arena;

buttons = encouter.buttons;
buttons_offset_x = 40;

text_offset_x = 20;
text_offset_y = 8;

// Typist for text
typist = scribble_typist();
typist.in(0.5, 0);
typist.sound_per_char(snd_voice_main, 1, 1);
typist.character_delay_add("!", 250);
typist.character_delay_add("?", 250);
typist.character_delay_add(".", 200);
typist.character_delay_add(",", 150);
