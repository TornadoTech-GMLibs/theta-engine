event_inherited();

translate_key = "Tornado";

name = locale_get("Name");
hp = 1600;
hp_max = 1700;

damage_effect_offset = new Vector2(60, 40);
damage_text_offset = new Vector2(40, 0);

image_body = new Image(spr_tornado_body, 0, x, y);
image_head = new Image(spr_tornado_head);
image_tail = new Image(spr_tornado_tail);

dialogue_bubble_scale = new Vector2(3, 3.1);
dialogue_bubble_offset = new Vector2(120, 60);

current_dialogue = ["Fuck you man"];

actions = [
	new EncouterAction("Check", function(encouter) {
		encouter.set_dialogue(locale_get("Check"));
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
