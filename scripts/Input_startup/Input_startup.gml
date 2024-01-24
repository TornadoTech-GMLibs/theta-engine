// Enums
enum input_source {
	press,
	up,
	down,
	left,
	right,
	select,
	skip,
	invetory,
	jump,
}

enum device_type {
	mouse,	
	keyboard,
	gamepad,
}

function input_startup() {
	// Globals
	global.devices = {};
	global.inputs = {};

	// Registartion
	device_register(new DeviceKeyboard());
	device_register(new DeviceMouse());
	device_register(new DeviceGamepad());

	// Default binds
	input_bind(input_source.press, new Key(device_type.mouse, mb_left));
	// input_unbind(input_source.press, new Key(device_type.mouse, mb_left));

	input_bind(input_source.up, [
		new Key(device_type.keyboard, vk_up),
		new Key(device_type.keyboard, "W"),
		new Key(device_type.gamepad, gp_padu),
	]);

	input_bind(input_source.down, [
		new Key(device_type.keyboard, vk_down),
		new Key(device_type.keyboard, "S"),
		new Key(device_type.gamepad, gp_padd),
	]);

	input_bind(input_source.left, [
		new Key(device_type.keyboard, vk_left),
		new Key(device_type.keyboard, "A"),
		new Key(device_type.gamepad, gp_padl),
	]);

	input_bind(input_source.right, [
		new Key(device_type.keyboard, vk_right),
		new Key(device_type.keyboard, "D"),
		new Key(device_type.gamepad, gp_padr),
	]);
	
	input_bind(input_source.select, [
		new Key(device_type.keyboard, vk_enter),
		new Key(device_type.keyboard, "Z"),
	]);
	
	input_bind(input_source.skip, [
		new Key(device_type.keyboard, vk_shift),
		new Key(device_type.keyboard, "X"),
	]);
	
	input_bind(input_source.jump, [
		new Key(device_type.keyboard, vk_space),
	]);

	input_bind(input_source.invetory, [
		new Key(device_type.keyboard, "I"),
		new Key(device_type.gamepad, gp_face3),
	]);
}
