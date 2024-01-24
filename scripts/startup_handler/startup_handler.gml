/// @desc DO NOT CALL IT MANUALLY, it is automatically subscribed by the engine to the on_game_startup event
function startup_handler() {
	randomize();
	
	show_debug_message("Hello!");
		
	room_goto(room_menu);
}
