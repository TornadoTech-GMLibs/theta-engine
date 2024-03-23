if keyboard_check(ord("~"))
{
    if (device_mouse_x_to_gui(0) >= analog_posx && device_mouse_x_to_gui(0) <= (analog_posx + (59 * analog_scale)))
        analog_center_x = (device_mouse_x_to_gui(0) - (21 * analog_scale))
    if (device_mouse_y_to_gui(0) >= analog_posy && device_mouse_y_to_gui(0) <= (analog_posy + (59 * analog_scale)))
        analog_center_y = (device_mouse_y_to_gui(0) - (21 * analog_scale))
}
else
{
    analog_center_x = (analog_posx + (((59 * analog_scale) / 2) - ((41 * analog_scale) / 2)))
    analog_center_y = (analog_posy + (((59 * analog_scale) / 2) - ((41 * analog_scale) / 2)))
}