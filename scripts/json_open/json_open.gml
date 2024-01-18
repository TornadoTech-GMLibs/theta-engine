/// @description Read file and parse it to JSON.
/// @param {String} path - The path to file with JSON
/// @return {Any}
function json_open(path) {
	var str = file_text_read_all_strings(path);
	
	try {
		return json_parse(str);
	} catch(error) {
		show_debug_message($"Json open failed, reason: {error.message} path: {path}");
		return undefined;
	}
}  
