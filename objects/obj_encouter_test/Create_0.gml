event_inherited();

audio.play(snd_core_remix);

translate_key = "Example";

player = new EncouterPlayer(id, "Tesmi", 1, 96, 98, 0, 320, [
	new EncouterItem("Test", 10),
	new EncouterItem("Test", 20),
	new EncouterItem("Test", 30),
]);

enemies = [
	new EncouterEnemy(new Vector2(room_width / 2, room_height - 420), obj_enemy_tornado),
];
create_enemies();

fight_object = obj_encouter_test_fight;
