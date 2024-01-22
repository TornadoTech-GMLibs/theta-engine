event_inherited();

// Imports
audio = encouter.audio;

// Setiings
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

// Custom
color = c_white;
colored = false;

actions = [
	new EncouterAction("Check", function(encouter) {
		encouter.set_dialogue(locale_get("Check"));
	}),
	
	// Navid is a scary thing that shows how you can combine dialogues
	new EncouterAction("Joke", function(encouter) {
		encouter.set_dialogue([
			"* You told a joke\n* You see the smile on his face",
		]).invoke_after_destroy(function() {
			create_dialogue([
				"* Pfffff",
			]).invoke_after_destroy(function() {
				encouter.set_dialogue([
					"* You don't understand his reaction, this is not a funny joke",
				]).invoke_after_destroy(function() {
					create_dialogue([
						"* Okay, that was pretty funny",
					]);
				});
			});
		});
	}),
	
	new EncouterAction("Throw paint", function(encouter) {
		if (colored) {
			encouter.set_dialogue(locale_get("NoPaint"));
			return;
		}
		
		color = c_lavender;
		colored = true;
		
		audio.pause();
		encouter.set_dialogue(locale_get("ThrowPaint")).invoke_after_destroy(function() {
			create_dialogue(locale_get("ThrowPaintReact")).invoke_after_destroy(function() {
				audio.resume();
			});
		});
	}),
];

kill = function() {
	create_dialogue([
		"* Fuck....",
	]).invoke_after_destroy(function() {
		encouter.set_dialogue([
			"* You won, you got pussy",
		]).invoke_after_destroy(function() {
			room_goto(room_menu);
		});
	});
}
