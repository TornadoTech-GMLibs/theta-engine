if (global.__engine_encouter_object == undefined) {
	// This error can be caused by incorrect arguments in encouter_start,
	// or an attempt to go to this room yourself using room_goto, room_goto_next, etc.
	throw new NullReferenceException();
}

instance_create_depth(0, 0, 0, global.__engine_encouter_object);

// We immediately clear the link,
// it will help track down bugs with transitions between encounters
global.__engine_encouter_object = undefined;

// Deleting yourself will probably be unnecessary, although a logical action
// instance_destroy();
