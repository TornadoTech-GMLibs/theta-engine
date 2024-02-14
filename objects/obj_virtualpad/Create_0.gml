if(scr_getdevice() != 1)
{
	instance_destroy();
}
if(variable_global_exists("virtualpadcreated"))
{
	instance_destroy()
}
global.virtualpadcreated = 1
zx = 800
zy = 240
xx = 800
xy = 320
cx = 800
cy = 400
button_scale = 2.5
analog_scale = 3.3
analog_posx = 50
analog_posy = 270
analog_edit_selected = 0
analog_center_x = (analog_posx + (((59 * analog_scale) / 2) - ((41 * analog_scale) / 2)))
analog_center_y = (analog_posy + (((59 * analog_scale) / 2) - ((41 * analog_scale) / 2)))
arrowkeys_area_size = 19.675
arrowkeys_back_area_size = 45
joystick_type = 0
settingsx = 5
settingsy = 5
controls_opacity = 0.5