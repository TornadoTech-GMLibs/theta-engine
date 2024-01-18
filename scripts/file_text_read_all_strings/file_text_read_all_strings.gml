/// @param {String} path
/// @param {String} default_str
/// @return {String}
function file_text_read_all_strings(path, default_str = "") {
	var buffer = buffer_load(path);
	var result = buffer_read(buffer, buffer_string);
	buffer_delete(buffer);
	
	if (result == "-1") {
		show_debug_message($"Can't read file, incorrect path: {path}");
		return default_str;
	}
	
	return result;
}