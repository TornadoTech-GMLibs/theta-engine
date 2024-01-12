// Simple animation for process.
// It's possible to make a timsource, sounds good.
if (!destroying)
	exit;

alpha = approach(alpha, 0, 0.01);
	
if (alpha != 0)
	exit;

instance_destroy();
