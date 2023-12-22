/// @param {Asset.GMObject} object
function encouter_start(object) {
	if (object == __engien_encouter_parent) {
		throw new InstantiateAbstractObjectException(object);
	}
	
	if (object_get_base_parent(object) != __engien_encouter_parent) {
		throw new ObjectIndentityException(object, __engien_encouter_parent);
	}
	
	global.__engine_encouter_object = object;
	room_goto(__engine_encouter_room);
}
