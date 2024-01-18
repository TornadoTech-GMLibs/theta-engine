/// @param {String} mask
/// @param {Constant.FileAttribute} attr
/// @return {Array<String>}
function file_find_all(mask, attr) {
	var files = [];
	var file_name = file_find_first(mask, attr);
	
	while (file_name != "") {
		array_push(files, file_name);
		file_name = file_find_next();
	}
	
	file_find_close();
	return files;
}
