extends Node2D

onready var Boss = load("res://Enemy/Boss.tscn")
var loadboss = 0

func _physics_process(_delta):
	if loadboss <200:
		loadboss += .25
	else:
		if get_child_count() == 0:
			loadboss = 0
			var boss = Boss.instance()
			boss.position = Vector2(randf()*Global.VP.x, randf()*Global.VP.y)
			add_child(boss)

