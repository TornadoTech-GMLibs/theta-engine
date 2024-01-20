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
	fight.start();
}

/// @params {String} key
/// @return {String}
locale_get = function(key) {
	return translate_get($"Encouters.{translate_key}.{key}");
}

#endregion
#region Events

// Fight
on_fight_start = function() {
	set_state(encouter_state.fight);
}

on_fight_end = function() {
	set_state(encouter_state.selecting);
	arena.set_postion(new Vector2(room_width / 2, room_height - 160));
	arena.set_size_base();
}

// Attack
on_attack_end = function() {
	set_state(encouter_state.enemy_dialogue);
	arena.set_size_dialogue();
	
	array_foreach(enemies_instance, function(enemy) {
		enemy.on_attack_end();
	});
}

// Dialogue
on_dialogue_end = function(state) {
	set_state(state);
}

on_enemy_dialogue_end = function() {
	start_fight();
}

on_player_death = function() {
	room_goto(room_encouter_game_over);
}

#endregion

translate_key = "Example";

player = new EncouterPlayer(id, "Tornado", 1, 20, 20, 0, 30, [
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
		encouter.set_dialogue(locale_get("MercyActions.Flee"));
	}),
];

buttons = [
	new EncouterButtonFight(),
	new EncouterButtonAct(),
	new EncouterButtonItem(),
	new EncouterButtonMercy(),
];

// Print in arena
text = locale_get("Text");

enemies = [];
enemies_instance = [];

state = encouter_state.selecting;

fight_object = undefined;

// Create all components (DO NOT CHANGE THE ORDER OF CREATION)
input = create_component(obj_encouter_input); // Completely controls keyboard input, except for soul control
background = create_component(obj_encouter_background); // Creates and animates the background
arena = create_component(obj_encouter_arena);
hud = create_component(obj_encouter_hud); // All graphical display (UI) except dialogs and battles
fight = create_component(obj_encouter_fight_controller); // Component of the current battle
audio = create_component(obj_encouter_audio);

// For test
// room_width = 640;
// room_height = 480;

arena.set_postion(new Vector2(room_width / 2, room_height - 160));
arena.set_size_base();
