/// @param {Real} target
/// @param {Array<Struct.Key>|Struct.Key} keys
function input_bind(target, keys) {
	// Well, no overloads and no overloads, so what's to be angry about?
	if (!is_array(keys)) {
		keys = [keys];
	}
	
	var container = input_get(target);
	if (container == undefined) {
		input_register(target, new InputContainer(keys));
		return;
	}
	
	container.add_keys(keys);
}
