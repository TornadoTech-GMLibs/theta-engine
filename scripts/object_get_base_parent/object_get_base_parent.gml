/// @param {Asset.GMObject} object
/// @return {Asset.GMObject|undefined}
function object_get_base_parent(object) {
	var parent = object_get_parent(object);
	
	if (!object_exists(object) || !object_exists(parent)) return undefined;
	var new_parent = undefined;
	
	do {
		new_parent = object_get_parent(parent);
		if (object_exists(new_parent)) {
			parent = new_parent;
		}
	} until (!object_exists(new_parent));
	
	return parent;
}
