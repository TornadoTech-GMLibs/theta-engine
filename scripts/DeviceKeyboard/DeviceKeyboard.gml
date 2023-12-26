function DeviceKeyboard() : Device() constructor {
	/// @param {Real} key
	/// @return {Bool}
	static check_pressed = function(key) {
		return keyboard_check_pressed(key);
	}
	
	/// @param {Real} key
	/// @return {Bool}
	static check_held = function(key) {
		return keyboard_check(key);
	}
	
	/// @param {Real} key
	/// @return {Bool}
	static check_released = function(key) {
		return keyboard_check_released(key);
	}
	
	/// @return {Real}
	static get_type = function() {
		return device_type.keyboard;
	}
	
	/// @return {Real}
	static get_index = function() {
		return 0;
	}
}
