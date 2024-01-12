// The component must have a link to the encounter,
// if it doesn’t, we created the component incorrectly
if (!variable_instance_exists(id, "encouter")) {
	// It seems like this will show an auto-hint
	// that the object has this field, lol
	encouter = noone;
	throw new NullReferenceException();
}
