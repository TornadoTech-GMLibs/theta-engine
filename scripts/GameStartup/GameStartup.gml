// Event triggered once at obj_entry_point to initialize engine systems
global.__engine_event_on_game_startup = new Event();
#macro __engine_on_game_startup global.__engine_event_on_game_startup

// Engine startup_handler
__engine_on_game_startup.connect(function() {
	show_debug_message("Hello from Engine!");
	
	scribble_font_set_default("font_determination");
	scribble_font_bake_outline_8dir("font_determination", "font_determination_outline", c_black, false);
});

// Forwards an engine event for processing in the game itself
__engine_on_game_startup.connect(startup_handler);
