event_inherited();

player = new EncouterPlayer("Tornado", 1, 20, 20, 0, 0, [
	new EncouterItem("Test", 10),
]);

enemies = [
	new EncouterEnemy(new Vector2(400, 176), obj_encouter_enemy_test),
];
create_enemies();
