function DeviceMouse() : Device() constructor {
	/// @param {Constant.MouseButton} key
	/// @return {Bool}
	static check_pressed = function(key) {
		return mouse_check_button_pressed(key);
	}
	
	/// @param {Constant.MouseButton} key
	/// @return {Bool}
	static check_held = function(key) {
		return mouse_check_button(key);
	}
	
	/// @param {Constant.MouseButton} key
	/// @return {Bool}
	static check_released = function(key) {
		return mouse_check_button_released(key);
	}
	
	/// @return {Real}
	static get_type = function() {
		return device_type.mouse;
	}
	
	/// @return {Real}
	static get_index = function() {
		return 0;
	}
}
