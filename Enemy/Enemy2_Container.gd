extends Node2D

onready var Enemy2 = load("res://Enemy/Enemy2.tscn")

func _physics_process(_delta):
	if get_child_count() == 0:
		var enemy2 = Enemy2.instance()
		enemy2.position = Vector2(randf()*Global.VP.x, randf()*Global.VP.y)
		add_child(enemy2)
