/// @param {Array<Struct.Key>} keys
function InputContainer(keys) constructor {
	self.keys = keys;
	self.keys_length = array_length(keys);
	
	/// @param {Function} callback
	/// @return {Bool}
	static __check = function(callback) {
		var i = 0;
		repeat (keys_length) {
			if (callback(keys[i])) {
				return true;
			}
			i++;
		}
		return false;
	}
	
	/// @return {Bool}
	static check_pressed = function() {
		return __check(function(key) {
			return key.check_pressed();
		});
	}
	
	/// @return {Bool}
	static check_held = function() {
		return __check(function(key) {
			return key.check_held();
		});
	}
	
	/// @return {Bool}
	static check_released = function() {
		return __check(function(key) {
			return key.check_released();
		});
	}
	
	/// @return {Struct.Key|Undefined}
	static get_key_index = function(key) {
		var i = 0;
		repeat (keys_length) {
			if (key.equals(keys[i])) {
				return i;
			}
			i++;
		}
		return undefined;
	}
	
	/// @param {Struct.Key} key
	/// @retrun {Bool}
	static has_key = function(key) {
		return get_key_index(key) != undefined;
	}
	
	/// @param {Real} index
	/// @param {Struct.Key} key
	static set_key = function(index, key) {
		keys[index] = key;
	}
	
	/// @param {Struct.Key} key
	static add_key = function(key) {
		var index = get_key_index(key);
		if (index != undefined) {
			set_key(index, key);
			return;
		}
		
		array_push(keys, key);
		keys_length++;
	}
	
	/// @param {Array<Struct.Key>} keys
	static add_keys = function(keys) {
		var i = 0;
		repeat (array_length(keys)) {
			add_key(keys[i]);
			i++;
		}
	}
	
	/// @param {Struct.Key} key
	static remove_key = function(key) {
		var index = get_key_index(key);
		if (index == undefined) {
			return;
		}
		array_delete(keys, index, 1);
		keys_length--;
	}
	
	/// @param {Array<Struct.Key>} keys
	static remove_keys = function(keys) {
		var i = 0;
		repeat (array_length(keys)) {
			remove_key(keys[i]);
			i++;
		}
	}
}
