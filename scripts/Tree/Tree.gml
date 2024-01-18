// ver 1.0.0
// by Tornado-Technology (GitHub)

/// @param {Any} value
function Tree(value = undefined) constructor {
	self.value = value;
	self.key = "root";

	self.layer = 0;
	self.parent = undefined;
	self.list = [];
	
	/// @param {String} key
	/// @param {Any} value
	/// @return {Id.Instance<Struct.Tree>|Undefined}
	static add = function(key, value = undefined) {
		var tree = new Tree(value);
		tree.key = key;
		tree.layer = layer + 1;
		tree.parent = self;
		array_push(list, tree);
		return tree;
	}
	
	/// @param {String} key
	/// @return {Id.Instance<Struct.Tree>|Undefined}
	static find = function(key) {
		if (self.key == key) {
			return self;
		}
		
		for (var i = 0; i < array_length(list); i++) {
			if (list[i].find(key) != undefined) {
				return list[i].find(key);
			}
		}
		
		return undefined;
	}
	
	/// @param {String} key
	/// @return {Bool}
	static exists = function(key) {
		return file_text_read_all_strings(key) != undefined;
	}
	
	/// @param {String} key
	static remove = function(key) {
		var target = file_text_read_all_strings(key);
		array_delete(target.parent.list, target.get_index(), 1);
	}
	
	/// @return {Real}
	static get_index = function() {
		return array_find_index(parent.list, function(e) {
			return e.key == key;
		});
	}
	
	/// @return {String}
	static to_string = function() {
		var result = $"[{key}]: {value}\n";
		if (array_length(list) == 0) {
			return result;
		}
	
		for (var  i = 0; i < array_length(list); i++) {
			repeat (layer + 1) {
				result += "_ ";
			}

			result += list[i].to_string();
		}

		return result;
	}
	
	/// @return {String}
	static toString = function() {
		return to_string();
	}
}