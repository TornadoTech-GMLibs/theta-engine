event_inherited();

// Imports
audio = encouter.audio;
player = encouter.player;

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

current_dialogue = ["Um..."];

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
			image_head.set_sprite(colored ? spr_tornado_head_laugh_painted : spr_tornado_head_laugh);
			create_dialogue([ 
				"* Pfffff",
			]).invoke_after_destroy(function() {
				encouter.set_dialogue([
					"* You don't understand his reaction, this is not a funny joke",
				]).invoke_after_destroy(function() {
					image_head.set_sprite(colored ? spr_tornado_head_painted : spr_tornado_head);
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
		
		name = $"Lavender {name}";
		image_head.set_sprite(spr_tornado_head_painted);
		
		color = c_lavender;
		colored = true;
		
		audio.pause();
		encouter.set_dialogue(locale_get("ThrowPaint")).invoke_after_destroy(function() {
			create_dialogue(locale_get("ThrowPaintReact")).invoke_after_destroy(function() {
				audio.resume();
			});
		});
	}),
	
	new EncouterAction("TakeItem", function(encouter) {
		encouter.set_dialogue([
			"* You found a [wave]new item![/wave]",
		]);
		
		player.add_item(
			choose(
				new EncouterItemHeal("Joker", 10),
				new EncouterItemHurt("Joker", 10)
			).set_description("A joker")
		);
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

dialogue_index = 0;
dialogues = [
	[
		"Fuck me man",
	],
];

on_attack_end = function() {
	
	if (dialogue_index < array_length(dialogues)) {
		current_dialogue = dialogues[dialogue_index];
	} else {
		current_dialogue = ["You know, it all started so well\nBut damn deadlines, they scare me"];
	}
	
	dialogue_index++;
	create_dialogue_bubble();
}
