/// @param {Real} from
/// @param {Real} to
/// @param {Real} duration
/// @param {Real} offset
/// @return {Real}
function wave(from, to, duration, offset = 0, time = current_time) {
	// Fucking math
	var a4 = (to - from) * 0.5;
	return from + a4 + cos((((time * 0.001) + duration * offset) / duration) * (pi * 2)) * a4;
}