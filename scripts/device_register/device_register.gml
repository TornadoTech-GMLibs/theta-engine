/// @param {Struct.Device} device
function device_register(device) {
	global.devices[$ device.get_type()] = device;
}
