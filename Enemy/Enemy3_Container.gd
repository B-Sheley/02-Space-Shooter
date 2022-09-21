extends Node2D

onready var Enemy3 = load("res://Enemy/Enemy3.tscn")

func _physics_process(_delta):
	if get_child_count() == 0:
		var enemy3 = Enemy3.instance()
		enemy3.position = Vector2(randf()*Global.VP.x, randf()*Global.VP.y)
		add_child(enemy3)
