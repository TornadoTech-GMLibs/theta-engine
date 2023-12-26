function Device() constructor {
	/// @param {Real} key
	/// @return {Bool}
	static check_pressed = function(key) {
		return false;
	}
	
	/// @param {Real} key
	/// @return {Bool}
	static check_held = function(key) {
		return false;
	}
	
	/// @param {Real} key
	/// @return {Bool}
	static check_released = function(key) {
		return false;
	}
	
	/// @return {Real|undefined}
	static get_type = function() {
		return undefined;
	}
	
	/// @return {Real}
	static get_index = function() {
		return 0;
	}
}
