if(scr_getdevice() != 1)
{
	instance_destroy();
}
if(variable_global_exists("virtualpadcreated"))
{
	instance_destroy()
}
global.virtualpadcreated = 1
zx = 0
zy = 0
xx = 0
xy = 0
cx = 0
cy = 0
button_scale = 3;
analog_scale = 3;
analog_center_x = 0
analog_center_y = 0
analog_posx = 50
analog_posy = 270
analog_edit_selected = 0
arrowkeys_area_size = 19.675
arrowkeys_back_area_size = 45
joystick_type = 0
settingsx = 5
settingsy = 5
controls_opacity = 0.5