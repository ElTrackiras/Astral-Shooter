extends Node2D

@onready var beez = load("res://bee_hitbox.tscn")
var speed = 4

func _ready():
	$SpawnEnemy.start()
	Global.score = 0
	RenderingServer.set_default_clear_color(Color.ROSY_BROWN)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#crosshair_controls()
	
func _on_spawn_enemy_timeout():
	var x = beez.instantiate()
	add_child(x)
		
func crosshair_controls():
	if $Interface/Left.is_pressed() and $Crosshair.position.x > -175:
		$Crosshair.position.x -= speed
	elif $Interface/Right.is_pressed() and $Crosshair.position.x < 284:
		$Crosshair.position.x += speed
	elif $Interface/Up.is_pressed() and $Crosshair.position.y > -100:
		$Crosshair.position.y -= speed
	elif $Interface/Down.is_pressed() and $Crosshair.position.y < 150:
		$Crosshair.position.y += speed
		
		
	elif $Interface/TopRight.is_pressed() and $Crosshair.position.x < 284 and $Crosshair.position.y > -100:
		$Crosshair.position.x += speed
		$Crosshair.position.y -= speed
	elif $Interface/TopLeft.is_pressed() and $Crosshair.position.x > -175 and $Crosshair.position.y > -100:
		$Crosshair.position.x -= speed
		$Crosshair.position.y -= speed
	elif $Interface/BottomRight.is_pressed() and $Crosshair.position.x < 284 and $Crosshair.position.y < 150:
		$Crosshair.position.x += speed
		$Crosshair.position.y += speed
	elif $Interface/BottomLeft.is_pressed() and $Crosshair.position.x > -175 and $Crosshair.position.y < 150:
		$Crosshair.position.x -= speed
		$Crosshair.position.y += speed
	



