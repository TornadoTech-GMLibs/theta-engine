/// @param {Array<Any>} array
/// @return {Any}
function array_pick(array) {
	return array[irandom_range(0, array_length(array) - 1)];
}
