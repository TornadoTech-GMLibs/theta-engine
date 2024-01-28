/// @param {String} name
function EncouterItemCleaner(name) : EncouterItem(name) constructor {
	self.description = $"???";
	self.dialogue = [
		$"* Вы съели {name}",
	];

	base_use = use;

	/// @param {Id.Instance} encouter
	use = function(encouter) {
		base_use(encouter);
		
		var player = encouter.player;
		start_dialogue(encouter);
	}
}
