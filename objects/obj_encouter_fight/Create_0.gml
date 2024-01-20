start = function() {

}

finish = function() {
	fight.destroy_elements();
}

/// @param {Asset.GMObject} object
/// @param {Struct} var_struct
/// @return {Id.Instance}
create_soul = function(object, var_struct = {}) {
	var_struct.encouter = encouter;
	var_struct.fight = fight;
	var_struct.player = encouter.player;
	return instance_create(object, var_struct);
}
