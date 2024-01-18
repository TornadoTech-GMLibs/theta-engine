/// @param {Real} val1
/// @param {Real} val2
/// @param {Real} amount
/// @return {Real}
function approach(val1, val2, amount) {
	return val1 < val2 ? min(val1 + amount, val2) : max(val1 - amount, val2);
}
