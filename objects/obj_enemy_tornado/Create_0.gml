event_inherited();

name = "Tornado";
hp = 1600;
hp_max = 1700;

image_body = new Image(spr_tornado_body, 0, x, y);
image_head = new Image(spr_tornado_head);
image_tail = new Image(spr_tornado_tail);

actions = [
	new EncouterAction("Check", function(encouter) {
		encouter.set_dialogue([
			"* Example - 5 ATK 5 DEF\n* For test.\n* Page 1.",
			"* Page 2\n    Lmao",
		]);
	}),
	new EncouterAction("Test 1", function(encouter) {
		encouter.set_dialogue([
			"* Example action \"Test 1\"",
		]);
	}),
	new EncouterAction("Test 2", function(encouter) {
		encouter.set_dialogue([
			"* Example action \"Test 2\"",
		]);
	}),
	new EncouterAction("Test 3", function(encouter) {
		encouter.set_dialogue([
			"* Example action \"Test 3\"",
		]);
	}),
	new EncouterAction("Test 4", function(encouter) {
		encouter.set_dialogue([
			"* Example action \"Test 4\"",
		]);
	}),
	new EncouterAction("Test 5", function(encouter) {
		encouter.set_dialogue([
			"* Example action \"Test 5\"",
		]);
	}),
];
