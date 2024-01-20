/// @param {Id.Instance} encouter
/// @param {String} name
/// @param {Real} lv
/// @param {Real} hp
/// @param {Real} hp_max
/// @param {Real} defense
/// @param {Real} damage
/// @param {Array<Struct.EncouterItem>} items
function EncouterPlayer(encouter, name, lv, hp, hp_max, defense, damage, items) constructor {
	self.encouter = encouter;
	
	self.name = name;
	self.lv = lv;
	
	self.hp = hp;
	self.hp_max = hp_max;
	self.defense = defense;
	
	self.damage = damage;
	self.items = items;
	
	/// @param {Real} amount
	static heal = function(amount) {
		if (amount < 0) {
			throw new Exception(); 
		}
		
		hp = min(hp + amount, hp_max);
	}
	
	/// @param {Real} damage
	static hurt = function(damage) {
		if (damage < 0) {
			throw new Exception();
		}
		
		hp = max(hp - max(abs(damage) - defense, 1), 0);
		
		if (hp <= 0) {
			kill();
		}
	}
	
	static kill = function() {
		encouter.on_player_death();
	}
	
	/// @param {Struct.EncouterItem} item
	static add_item = function(item) {
		array_push(items, item);
	}
	
	/// @return {Bool} damage
	static has_items = function() {
		return array_length(items) > 0;
	}
}
