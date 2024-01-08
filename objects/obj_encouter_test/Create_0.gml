event_inherited();

player = new EncouterPlayer("Player", 1, 20, 20, 0, 0, [
	new EncouterItem("Test", 10),
]);

enemies = [
	new EncouterEnemy("Sans udertale", new Vector2(400, 176), obj_encouter_enemy_test),
	new EncouterEnemy("Sans udertale", new Vector2(200, 176), obj_encouter_enemy_test),
];
create_enemies();
