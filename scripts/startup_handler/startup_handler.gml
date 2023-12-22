/// @desc DO NOT CALL IT MANUALLY, it is automatically subscribed by the engine to the on_game_startup event
function startup_handler() {
	show_debug_message("Hello!");
	encouter_start(obj_encouter_test);
}
