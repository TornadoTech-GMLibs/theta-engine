/// @param {Real} target
/// @param {Array<Struct.Key>|Struct.Key} keys
function input_unbind(target, keys) {
	// Well, no overloads and no overloads, so what's to be angry about?
	if (!is_array(keys)) {
		keys = [keys];
	}
	
	var container = input_get(target);
	if (container == undefined) {
		return;
	}
	
	container.remove_keys(keys);
}
