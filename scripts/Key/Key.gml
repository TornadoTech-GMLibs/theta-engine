/// @description A simple DTO structure that allows you to optimize and simplify your work with key assignment and unassignment. Stores the index of the key and the device to process it. 
/// @param {Real} type - value from enum `device_type`
/// @param {Real|String|Constant.VirtualKey|Constant.GamepadButton|Constant.MouseButton} index
function Key(type, index) constructor {
	self.index = is_string(index) ? ord(index) : index;
	self.device = device_get(type);
	
	/// @param {Struct.Key} key
	/// @return {Bool}
	static equals = function(key) {
		return index == key.index && device == key.device;
	}
	
	/// @return {Bool}
	static check_pressed = function() {
		return device.check_pressed(index);
	}
	
	/// @return {Bool}
	static check_held = function() {
		return device.check_held(index);
	}
	
	/// @return {Bool}
	static check_released = function() {
		return device.check_released(index);
	}
}
