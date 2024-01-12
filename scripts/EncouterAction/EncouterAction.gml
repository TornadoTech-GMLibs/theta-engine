/// @param {String} name
/// @param {Function} callback
function EncouterAction(name, callback) constructor {
	self.name = name;
	self.callback = callback;
	
	/// @param {Id.Instance} encouter
	static invoke = function(encouter) {
		callback(encouter);
	}
}
