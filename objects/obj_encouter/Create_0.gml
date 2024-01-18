#region Methods

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

set_dialogue = function(dialogue) {
	instance_create(obj_encouter_dialogue, {
		encouter: id,
		dialogue: dialogue,
		state: state,
	});
	
	set_state(encouter_state.encouter_dialogue);
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

start_fight = function() {
	set_state(encouter_state.fight);
	fight.start();
}

#endregion
#region Events

on_attack_end = function() {
	set_state(encouter_state.enemy_dialogue);
	// enemies[0].create_dialogue_bubble();
	arena.set_size_dialogue();
}

on_dialogue_end = function(state) {
	set_state(state);
}

on_enemy_dialogue_end = function() {
	start_fight();
}

#endregion

player = new EncouterPlayer("Tornado", 1, 20, 20, 0, 30, [
	new EncouterItem("Test", 10),
]);

// The list of actions displayed in the mercy menu
mercy_actions = [
	new EncouterAction("Mercy", function(encouter) {
		array_foreach(enemies_instance, function(enemy) {
			enemy.on_mercy();
		});
	}),
	new EncouterAction("Flee", function(encouter) {
		encouter.set_dialogue([
			"* You try to run as hard as you can...",
	        "* But besides, the developers did not foresee such a development of events",
	        "* You stayed in the battle, [c_red]Хе-хе!",
			"* [speed, 0.5]B R U H", // Bruh moment
		]);
	}),
];

buttons = [
	new EncouterButtonFight(),
	new EncouterButtonAct(),
	new EncouterButtonItem(),
	new EncouterButtonMercy(),
];

// Print in arena
text = translate_get("Engine.Test");

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

arena.set_postion(new Vector2(316, 316));
arena.set_size_base();
