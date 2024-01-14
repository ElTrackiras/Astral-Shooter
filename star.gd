extends Area2D


@export var HEALTH : int = 100
var direction = "star_left"
var speed = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimatedSprite2D.play("Default")
	
	if direction == "star_left":
		position.x -= speed
		if position.x <= 0:
			direction = "star_right"
	elif direction == "star_right":
		position.x += speed
		if position.x >= 400:
			direction = "star_left"
	else:
		speed = 0
	
	check_health()
		


func check_health():
	if HEALTH <= 0:
		get_tree().change_scene_to_file("res://game_over.tscn")
