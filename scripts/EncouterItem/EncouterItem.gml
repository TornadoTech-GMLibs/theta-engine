/// @param {String} name
function EncouterItem(name) constructor {
	self.name = name;
	self.description = "This is a Item";
	self.dialogue = [];
	
	self.__engine_buffer_encouter = noone;
	
	/// @param {Id.Instance} encouter
	on_after_use = function(encouter) {
	
	}
	
	/// @param {Id.Instance} encouter
	use = function(encouter) {
		var player = encouter.player;
		var items = player.items;
		
		array_delete(items, array_find_index(items, function(e) { 
			return e == self;
		}), 1);
	}
	
	/// @param {Id.Instance} encouter
	static start_dialogue = function(encouter) {
		// Fucking GMS
		__engine_buffer_encouter = encouter;
		
		encouter.set_dialogue(dialogue).invoke_after_destroy(function() {
			on_after_use(__engine_buffer_encouter);
		});
	}
	
	/// @param {Array<String>} dialogue
	/// @return {Struct.EncouterItem}
	static set_dialogue = function(dialogue) {
		self.dialogue = dialogue;
		return self;
	}
	
	/// @param {String} description
	/// @return {Struct.EncouterItem}
	static set_description = function(description) {
		self.description = description;
		return self;
	}
	
	/// @param {Function} use
	/// @return {Struct.EncouterItem}
	static set_use = function(use) {
		self.use = use;
		return self;
	}
}

/// @param {String} name
/// @param {Real} heal
function EncouterItemHeal(name, heal) : EncouterItem(name) constructor {
	self.heal = heal;
	self.description = $"Востонавливает: [c_green]{heal} ОЗ";
	self.dialogue = [
		$"* Вы съели {name}",
		$"* Вам стало прикольно"
	];
	
	base_use = use;
	
	/// @param {Id.Instance} encouter
	use = function(encouter) {
		base_use(encouter);
		
		var player = encouter.player;
		
		player.heal(heal);
		audio_play_sound(snd_heal, 0, false);

		start_dialogue(encouter);
	}
}

/// @param {String} name
/// @param {Real} damage
function EncouterItemHurt(name, damage) : EncouterItem(name) constructor {
	self.damage = damage;
	self.description = $"Вы получаете: [c_red]-{damage} ОЗ";
	self.dialogue = [
		$"* Вы съели {name}",
		$"* Вам стало хуже"
	];
	
	base_use = use;
	
	/// @param {Id.Instance} encouter
	use = function(encouter) {
		base_use(encouter);
		
		var player = encouter.player;
		
		player.hurt(damage);
		audio_play_sound(snd_hurt, 0, false);

		start_dialogue(encouter);
	}
}

/// @param {String} name
/// @param {Real} damage
function EncouterItemSetDamage(name, damage) : EncouterItem(name) constructor {
	self.damage = damage;
	self.description = $"Наносит: [c_red]{damage} урона";
	self.dialogue = [
		$"* Вы взяли {name}",
		$"* Вы выглядите опасно"
	];
	
	base_use = use;
	
	/// @param {Id.Instance} encouter
	use = function(encouter) {
		base_use(encouter);

		var player = encouter.player;
		
		player.damage = damage;
		audio_play_sound(snd_grab, 0, false);

		start_dialogue(encouter);
	}
}


/// @param {String} name
/// @param {Real} defense
function EncouterItemSetDefense(name, defense) : EncouterItem(name) constructor {
	self.defense = defense;
	self.description = $"Блокирует: [c_yellow]{defense} урона";
	self.dialogue = [
		$"* Вы экипировали {name}",
		$"* Вы выглядите круто"
	];
	
	base_use = use;
	
	/// @param {Id.Instance} encouter
	use = function(encouter) {
		base_use(encouter);

		var player = encouter.player;
		
		player.defense = defense;
		audio_play_sound(snd_grab, 0, false);

		start_dialogue(encouter);
	}
}

