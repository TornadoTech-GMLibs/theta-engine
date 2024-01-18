/// @param {Real} lang_id
function translate_set_lang(lang_id) {	
	var root = global._translate_langs[lang_id];
	var json = json_open(translate_directory + root + "/" + translate_language_main);
	var info = json_open(translate_directory + root + "/" + translate_language_info);

	// Set globals...
	global.__engine_translate_lang_id = lang_id;
	global.__engine_translate_lang_json = json;
	global.__engine_translate_lang_info = info;
	
	show_debug_message($"Translate set new language: {lang_id}");
	
	on_translate_update.invoke();
}
