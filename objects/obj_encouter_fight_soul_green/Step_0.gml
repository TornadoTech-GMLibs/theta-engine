event_inherited();

var input = new Vector2(
	input_held(input_source.right) - input_held(input_source.left), 
	input_held(input_source.down) - input_held(input_source.up)
).smulti(1, -1);

if (!input.equals(vector2_zero)) {
	target_angle = input.get_angle();
}

image_angle = lerp(image_angle, target_angle, target_amount);