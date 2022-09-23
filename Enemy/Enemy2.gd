extends KinematicBody2D


onready var Enemy_Bullet_F = load("res://Enemy/Enemy_Bullet_F.tscn")
var nose = Vector2(0,-60)
var health = 20
var score = 50
var direction = Vector2(3,0)
var wobble = 8.0

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
		var enemy_bullet_F = Enemy_Bullet_F.instance()
		enemy_bullet_F.global_position = global_position + nose.rotated(dir)
		enemy_bullet_F.rotation = dir
		Effects.add_child(enemy_bullet_F)
		$AudioStreamPlayer2D.play()

func _physics_process(_delta):
	position += direction
	position.y = position.y + sin(position.x/20)*wobble
	if position.x >= Global.VP.x + 200:
		queue_free()
