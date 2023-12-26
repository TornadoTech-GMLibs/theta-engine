function DeviceGamepad() : Device() constructor {
	/// @param {Constant.GamepadButton} key
	/// @return {Bool}
	static check_pressed = function(key) {
		return gamepad_button_check_pressed(get_index(), key);
	}
	
	/// @param {Constant.GamepadButton} key
	/// @return {Bool}
	static check_held = function(key) {
		return gamepad_button_check(get_index(), key);
	}
	
	/// @param {Constant.GamepadButton} key
	/// @return {Bool}
	static check_released = function(key) {
		return gamepad_button_check_released(get_index(), key);
	}
	
	/// @return {Real}
	static get_type = function() {
		return device_type.gamepad;
	}
	
	/// @return {Real}
	static get_index = function() {
		return 0;
	}
}
