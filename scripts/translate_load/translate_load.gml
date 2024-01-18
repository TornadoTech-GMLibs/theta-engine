function translate_load() {
	global._translate_langs = is_mobile ? translate_languages_offical : file_find_all("translate/*", fa_directory);
	show_debug_message($"Translate load {array_length(global._translate_langs)} langs.");
}