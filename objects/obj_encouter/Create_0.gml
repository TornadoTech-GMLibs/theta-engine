/// @param {Asset.GMObject} object
/// @return {Id.Instance}
create_component = function(object) {
	if (object == obj_encouter_component) {
		throw new InstantiateAbstractObjectException(object);
	}
	
	if (object_get_base_parent(object) != obj_encouter_component) {
		throw new ObjectIndentityException(object, obj_encouter_component);
	}
	
	return instance_create(object, { encouter: id });
}

// A method to create enemies from a list, (Called below the definition)
create_enemies = function() {
	var i = 0;
	repeat (array_length(enemies)) {
		enemies_instance[i] = enemies[i].create(id);
		i++;
	}
}

/// @param {Real} target
/// @param {Real} damage
enemy_hurt = function(target, damage) {
	enemies_instance[target].hurt(damage);
}

/// @params {Real} index
set_state = function(index) {
	state = index;
}

on_attack_end = function() {
	set_state(encouter_state.enemy_dialogue);
	// enemies[0].create_dialogue_bubble();
	arena.set_size_dialogue();
}

player = new EncouterPlayer("Tornado", 1, 20, 20, 0, 0, [
	new EncouterItem("Test", 10),
]);

buttons = [
	new EncouterButtonFight(),
	new EncouterButtonAct(),
	new EncouterButtonItem(),
	new EncouterButtonMercy(),
];


// Print in arena
text = "* Welcome to ThetaEngine!\n* We make cool things\n* by TornadoTech";

enemies = [];
enemies_instance = [];

state = encouter_state.selecting;

// Create all components (DO NOT CHANGE THE ORDER OF CREATION)
input = create_component(obj_encouter_input); // Completely controls keyboard input, except for soul control
background = create_component(obj_encouter_background); // Creates and animates the background
arena = create_component(obj_encouter_arena);
hud = create_component(obj_encouter_hud); // All graphical display (UI) except dialogs and battles
fight = create_component(obj_encouter_fight); // Component of the current battle

// For test
// room_width = 640;
// room_height = 480;

arena.set_postion(new Vector2(320, 304));
arena.set_size_base();
