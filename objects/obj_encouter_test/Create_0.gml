event_inherited();

// Play background music
audio.play(snd_core_remix);

// The key that is used in translations
// can be said to be the name of the encouter
translate_key = "Example";

// Player parameters, in order
// id, player name, level, hp, hp_max, defens, attack
player = new EncouterPlayer(id, "Tesmi", 1, 96, 98, 0, 320, [
	new EncouterItemHeal("Тест 1", 10),
	new EncouterItemHeal("Тест 2", 20),
	new EncouterItemHeal("Тест случайный", irandom_range(10, 20)),
	new EncouterItemHurt("Тест -1", 20),
	new EncouterItemHurt("Битое стекло", 30).set_description("Оно выглядит разбитым"),
	new EncouterItemSetDamage("Палка отладки", 1000),
	new EncouterItemSetDefense("Ультра шорты", 1000).set_dialogue([
		"* Вы одеваете самые моднявые шорты на районе",
		"* Теперь ваша защита не знает границ",
	]),
	new EncouterItemCleaner("Ведро"),
]);

// List of actions that will be shown in the mercy menu
mercy_actions = [
	new EncouterAction("Mercy", function(encouter) {
		array_foreach(enemies_instance, function(enemy) {
			enemy.on_mercy();
		});
	}),
	new EncouterAction("Flee", function(encouter) {
		encouter.set_dialogue(locale_get("MercyActions.Flee"));
	}),
	new EncouterAction("Test", function(encouter) {
		encouter.set_state(encouter_state.cutscene);
	}),
];

// The code to create an enemy, there can be more than one,
// but this will greatly increase the complexity of development
enemies = [
	new EncouterEnemy(new Vector2(room_width / 2, room_height - 420), obj_enemy_tornado),
];
create_enemies();

// The object that is used to write attacks
fight_object = obj_encouter_test_fight;
