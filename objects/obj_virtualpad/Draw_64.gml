zx = (window_get_width() * 0.75) - 90
zy = (window_get_height() / 2) + window_get_height() * 0.094
xx = (window_get_width() * 0.75)
xy = (window_get_height() / 2) + window_get_height() * 0.096
cx = (window_get_width() * 0.75) + 90
cy = (window_get_height() / 2) + window_get_height() * 0.098
analog_scale = 3.3
button_scale = 3
analog_posx = window_get_width() * 0.05
analog_posy = window_get_height() * 0.5
draw_sprite_ext(spr_z_button, keyboard_check(ord("Z")), zx, zy, button_scale, button_scale, 0, c_white, controls_opacity)
draw_sprite_ext(spr_x_button, keyboard_check(ord("X")), xx, xy, button_scale, button_scale, 0, c_white, controls_opacity)
draw_sprite_ext(spr_c_button, keyboard_check(ord("C")), cx, cy, button_scale, button_scale, 0, c_white, controls_opacity)
draw_sprite_ext(spr_joybase, joystick_type, analog_posx, analog_posy, analog_scale, analog_scale, 0, c_white, controls_opacity)
draw_sprite_ext(spr_joystick, joystick_type, analog_center_x, analog_center_y, analog_scale, analog_scale, 0, c_white, controls_opacity)