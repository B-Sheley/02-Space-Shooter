extends KinematicBody2D


onready var Enemy_Bullet_B = load("res://Enemy/Enemy_Bullet_B.tscn")
var nose = Vector2(0,-80)
var health = 300
var score = 500
var direction = Vector2(.4,0)
var wobble = 1.0

func _ready():
	pass 

func damage(d):
	health -= d
	if health <=0:
		Global.update_score(score)
		queue_free()
		



func _on_Bullet_F_timeout():
	var Player = get_node_or_null("/root/Game/Player_Container/Player")
	var Effects = get_node_or_null("/root/Game/Effects")
	if Player != null and Effects != null:
		var dir = global_position.angle_to_point(Player.global_position)-PI/2
		var enemy_bullet_B = Enemy_Bullet_B.instance()
		enemy_bullet_B.global_position = global_position + nose.rotated(dir)
		enemy_bullet_B.rotation = dir
		Effects.add_child(enemy_bullet_B)
		$AudioStreamPlayer2D.play()

func _physics_process(_delta):
	position += direction
	position.y = position.y + sin(position.x/20)*wobble
	if position.x >= Global.VP.x + 200:
		queue_free()
