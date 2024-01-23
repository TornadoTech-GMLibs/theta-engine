// Fucking math
position = new Vector2(x, y);

_width = lerp(_width, size.x, 0.3);
_height = lerp(_height, size.y, 0.3);

border.up.x = x + dcos(image_angle + 90) * _height / 2;
border.up.y = y - dsin(image_angle + 90) * _height / 2;
border.up.image_xscale = _width / border_size;
border.up.image_angle = image_angle;

border.down.x = x + dcos(image_angle - 90) * _height / 2;
border.down.y = y - dsin(image_angle - 90) * _height / 2;
border.down.image_xscale = _width / border_size;
border.down.image_angle = image_angle;

border.left.x = x + dcos(image_angle + 180) * _width / 2;
border.left.y = y - dsin(image_angle + 180) * _width / 2;
border.left.image_yscale = _height / border_size;
border.left.image_angle = image_angle;

border.right.x = x + dcos(image_angle) * _width / 2;
border.right.y = y - dsin(image_angle) * _width / 2;
border.right.image_yscale = _height / border_size;
border.right.image_angle = image_angle;

image_xscale = _width / sprite_unwidth;
image_yscale = _height / sprite_unheight;
