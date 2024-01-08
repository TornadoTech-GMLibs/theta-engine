if (destroying) {
	alpha = approach(alpha, 0, 0.01);
	if (alpha == 0) {
		instance_destroy();
	}
}
