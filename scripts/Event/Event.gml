// ver 1.0.0
// by Tornado-Technology (GitHub)

/// @desc Base class for create Events like C# delegate
function Event() constructor {
	self.listeners = [];
	
	/// @param {Function} callback - A subscriber called by the invoke() method can be unsubscribed with disconnect()
	/// @return {Function}
	static connect = function(callback) {
		array_push(listeners, callback)
		return callback;
	}
	
	/// @param {Function} callback - Subscriber you want to unsubscribe
	/// @return {Bool} Operation report, erased - true, in other cases - false
	static disconnect = function(callback) {
		for (var i = 0; i < array_length(listeners); i++) {
			var element = listeners[i];
			
			if (callback == element) {
				array_delete(listeners, i, 1);
				return true;
			}
		}
		
		return false;
	}
	
	/// @desc Disconnects all listeners
	static disconnect_all = function() {
		array_delete(listeners, 0, array_length(listeners) + 1); // array_clear(listeners);
	}
	
	/// @desc Calls all subscribers with the specified arguments packed array
	/// @param {Any} ... - Arguments for callback
	static invoke = function() {
		var array = [];
		
		var i = 0;
		repeat (argument_count) {
			array_push(array, argument[i]);
			i++;
		}

		invoke_for_array(array);
	}

	/// @param {Array<Any>} array - Arguments for callback
	static invoke_for_array = function (array) {
		var i = 0;
		repeat (array_length(listeners)) {
			var listener_method = listeners[i];
			method_call(listener_method, array);	
			i++;
		}
	}
}