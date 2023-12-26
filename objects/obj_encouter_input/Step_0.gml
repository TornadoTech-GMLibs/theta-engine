if (input_pressed(input_source.left) && selected_button > 0) {
	selected_button--;
}
	
if (input_pressed(input_source.right) && selected_button < button_length - 1) {
	selected_button++;
}
	