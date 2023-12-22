/// @param {String} name
/// @param {Real} heal
function EncouterItem(name, heal) constructor {
	self.name = name;
	self.heal = heal;

	use = function(encouter) {
		var player = encouter.player;
		var items = player.items;
		
		array_delete(items, array_find_index(items, function(e) { 
			return e == self;
		}), 1);
		
		player.heal(heal);	
	}
}
