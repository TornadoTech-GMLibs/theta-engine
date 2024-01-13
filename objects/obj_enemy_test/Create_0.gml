event_inherited();

name = "Sans undertale";
hp = 100;
hp_max = 200;

image_legs = new Image(spr_sans_legs, 0, x, y);
image_body = new Image(spr_sans_body);
image_head = new Image(spr_sans_head);

damage_offset_x = 40;
damage_offset_y = 0;

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
