depth = encouter_depth.enemy;

translate_key = "Enemy";

name = "Enemy";
hp = 100;
hp_max = 100;

damage_effect_offset = new Vector2(0, 0);
damage_text_offset = new Vector2(40, 0);

defense = 1;

voice = snd_voice_main;

dialogue_bubble_sprite = spr_encouter_dialogue_bubble;
dialogue_bubble_scale = vector2_one;
dialogue_bubble_offset = vector2_zero;

current_dialogue = [];

actions = [];

/// @param {String} key
/// @return {String}
locale_get = function(key) {
	return encouter.locale_get($"Enemies.{translate_key}.{key}");
}

/// @param {Real} damage
hurt = function(damage) {
	instance_create_depth(x + damage_effect_offset.x, y + damage_effect_offset.y, depth - 1, obj_encouter_attack_weapon_effect, {
		damage: damage,
		enemy: id,
	});
}

kill = function() {
	
}

shake = function() {
	// TODO: Add realisation
}

/// @param {Array<String>} dialogue
/// @param {Bool} start_fight
/// @return {Id.Instance}
create_dialogue = function(dialogue, start_fight = false) {
	current_dialogue = dialogue;
	return create_dialogue_bubble(start_fight);
}

/// @param {Bool} start_fight
/// @return {Id.Instance}
create_dialogue_bubble = function(start_fight = true) {
	var dialogue_bubble = instance_create_depth(x + dialogue_bubble_offset.x, y + dialogue_bubble_offset.y, -999, obj_encouter_dialogue_bubble, {
		dialogue: current_dialogue,
		encouter: encouter,
		enemy: id,
		sprite_index: dialogue_bubble_sprite,
		image_xscale: dialogue_bubble_scale.x,
		image_yscale: dialogue_bubble_scale.y,
	});
	
	dialogue_bubble.invoke_after_destroy(function() {
		// As usual, we trigger events in the main object so that we can communicate
		encouter.set_previous_state();
		encouter.arena.set_position_base();
		encouter.arena.set_size_base();
	});
	
	if (start_fight) {
		dialogue_bubble.invoke_after_destroy(function() {
			encouter.start_fight();
		});	
	}
	
	encouter.arena.set_size_dialogue();
	encouter.set_state(encouter_state.enemy_dialogue);
	return dialogue_bubble;
}

#region Events

on_take_damage_callback = function() {
	if (hp > 0)
		return;
		
	kill();
}

on_take_damage = new Event();
on_take_damage.connect(on_take_damage_callback);




on_mercy = function() {

}

on_attack_end = function() {
	create_dialogue_bubble();
}

/// @param {Real} damage
on_hurt_end = function(damage) {
	var _damage = max(damage - defense, 0);
	hp = max(hp - _damage, 0);
		instance_create_depth(x + damage_text_offset.x, y + damage_text_offset.y, depth - 1, obj_encouter_attack_damage, {
		hp: hp,
		hp_max: hp_max,
		damage: _damage
	});
	
	if (damage > 0) {
		audio_play_sound(snd_damage, 0, false);
		shake();
	}
	
	on_take_damage.invoke();
}
#endregion