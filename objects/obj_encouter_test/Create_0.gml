event_inherited();

translate_key = "Example";

player = new EncouterPlayer(id, "Tesmi", 1, 10, 20, 0, 30, [
	new EncouterItem("Test", 10),
	new EncouterItem("Test", 20),
	new EncouterItem("Test", 30),
]);

enemies = [
	new EncouterEnemy(new Vector2(room_width / 2, room_height - 420), obj_enemy_tornado),
];
create_enemies();

fight_object = obj_encouter_test_fight;
