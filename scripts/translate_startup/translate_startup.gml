#macro on_translate_update global.__engine_event_on_translate_update

function translate_startup() {
	global.__engine_translate_lang_id = 0;
	global.__engine_translate_lang_json = undefined;
	global.__engine_translate_lang_info = undefined;
	global.__engine_event_on_translate_update = new Event();
	
	translate_load()
	translate_set_lang(translate_language_default)
}