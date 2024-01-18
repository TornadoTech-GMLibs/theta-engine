event_inherited();

player = new EncouterPlayer("Player", 1, 20, 20, 0, 30, [
	new EncouterItem("Test", 10),
	new EncouterItem("Test", 10),
	new EncouterItem("Test", 10),
]);

enemies = [
	// new EncouterEnemy(new Vector2(400, 176), obj_enemy_test),
	new EncouterEnemy(new Vector2(240, 60), obj_enemy_tornado),
];
create_enemies();
