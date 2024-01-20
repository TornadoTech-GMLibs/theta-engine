event_inherited();

instance = noone;

start = function() {	
	encouter.on_fight_start();
	
	// Required to save a fight instance (Save variables, that's all)
	if (instance == noone) {
		instance = create_instance();
	}
	
	// REALLY starting the battle
	instance.start();
}

finish = function() {
	encouter.on_fight_end();
	
	instance.finish();
}

destroy_elements = function() {
	with (obj_encouter_fight_element) {
		instance_destroy()
	}
} 

/// @return {Id.Instance}
create_instance = function() {
	if (encouter.fight_object == undefined) {
		throw new NullReferenceException();
	}
	
	if (encouter.fight_object == obj_encouter_fight) {
		throw new InstantiateAbstractObjectException(obj_encouter_fight);
	}
	
	if (object_get_base_parent(encouter.fight_object) != obj_encouter_fight) {
		throw new ObjectIndentityException(encouter.fight_object, obj_encouter_fight);
	}
	
	return instance_create(encouter.fight_object, {
		encouter: encouter,
		fight: id,
	});
}
