/// @desc Creates the specified object at x: 0, y: 0 coordinates, and with depth: 0
/// @param {Asset.GMObject} obj - The object index of the object to create an instance of
/// @param {Struct} var_struct - A struct with variables to assign to the new instance
/// @return {Id.Instance}
function instance_create(obj, var_struct = {}) {
	return instance_create_depth(0, 0, 0, obj, var_struct);
}
