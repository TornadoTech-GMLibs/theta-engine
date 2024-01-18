/// @param {String} key
/// @return {String}
function translate_get(key = "") {
	var json = global.__engine_translate_lang_json;
	
	if (json == undefined) {
		show_debug_message($"Trasnlate language not laoded before geting, key: {key}");
		return key;
	}
	
	// Return a string value
	var keys = string_split(key, ".");
	var path = json[$ keys[0]];
	var new_path = -1;
	
	try {
		for (var i = 1; i < array_length(keys); i++) {
			new_path = path[$ keys[i]];
			path = new_path;
		}
	} catch(error) {
		return key;
	}
	
	return path == undefined ? key : path;
}
