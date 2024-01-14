extends Area2D

@onready var randomX = randi_range(10, 470)
@onready var randomPattern = randi_range(0, 1)
var fall_speed = 1
var dead = false
var free_fall = false
# Called when the node enters the scene tree for the first time.

#Bee can go from 10 to 470
func _ready():
	position.x = randomX
	position.y = 0


var direction = randi_range(0, 1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimatedSprite2D.play("Fly")
	check_crosshair()
	if randomPattern == 0:
		position.y += fall_speed
		
	elif randomPattern == 1:
		position.y += fall_speed * 0.5
		if direction == 0:
			if position.x <= 10:
				direction = 1
			position.x -= 1
		elif direction == 1:
			if position.x >= 470:
				direction = 0
			position.x += 1
		
	if position.y > 1000:
		queue_free()

	if dead:
		$AnimatedSprite2D.rotation += 0.2
		position.y -= 1.5
		if free_fall:
			fall_speed += 0.3
		if position.y > 280:
			Global.score += 1
			queue_free()

func check_crosshair():
	for i in get_overlapping_areas():
		if i.name == "Crosshair":
			if $GotHit.playing == false:
				$GotHit.play()
			
			$AnimatedSprite2D.flip_v = true
			$DeathTimer.start()
			dead = true
			
			
			
		if i.name == "Star":
			queue_free()
			if not dead:
				$"../Star".HEALTH -= 10


func _on_death_timer_timeout():
	free_fall = true
