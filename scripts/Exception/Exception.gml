// ver 1.0.0
// Original author: KeeVeeGames (GitHub)
// Original url: https://github.com/KeeVeeGames/Exception.gml/tree/master
// Modifed by Tornado-Technology (GitHub)

function Exception() constructor {
    self.message = "";
    self.long_message = "";
    self.exception_name = "";
	self.script = "";
    self.line = -1;
    self.stacktrace = []; 

    var stack = debug_get_callstack();
    var length = array_length(stack) - 1;
    
	for (var i = 2; i < length; i++) {
        var stackline = stack[i];
        var colon_position = string_pos(":", stackline);
        
        if (i == 2) {
            script = string_copy(stackline, 1, colon_position - 1);
            line = real(string_copy(stackline, colon_position + 1, string_length(stackline) - colon_position));
        }
        
        stackline = string_replace(stackline, ":", " (line ");
        stackline += ")";
        
        array_push(stacktrace, stackline);
    }

    static init = function() {
        exception_name = instanceof(self);
        
        // Add more info for YYC as it is not adding standard error output like on VM
        if (!code_is_compiled()) return;
        long_message = $"Unable to find a handler for exception {long_message}\r\n";

		var i = 0
        repeat (array_length(stacktrace)) {
            long_message += $"\r\n{stacktrace[i]}";
			i++
        }
    }
	
	/// @return {String}
    static to_string = function() {
        return $"{exception_name}\r\n{message}\r\n{long_message}";
    }

	/// @return {String}
    static toString = function() {
        return to_string();
    }    
}

/// @param {Strcut} reference
/// @param {Strcut} target
function StructIndentityException(reference, target) : Exception() constructor {
	message = "The resulting structure does not match the expected format";
	long_message = $"Reference: {reference}\r\nTarget: {target}";
	init();
}

/// @param {Asset.GMObject} object
function InstantiateAbstractObjectException(object) : Exception() constructor {
	message = $"Try instantiate abstract {object_get_name(object)}";
	long_message =  $"You can't use abstract object for instantiation";
	init();
}

/// @param {Asset.GMObject} reference
/// @param {Asset.GMObject} parent
function ObjectIndentityException(reference, parent) : Exception() constructor {
	message = $"{object_get_name(reference)} must be inherited from {object_get_name(parent)}";
	init();
}

// TODO: made exception
function NullReferenceException() : Exception() constructor {
	init();
}
