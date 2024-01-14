extends Area2D


# Called when the node enters the scene tree for the first time.

@export var speed : float = 230

@export var joystick_left : VirtualJoystick

var move_vector := Vector2.ZERO

func _process(delta: float) -> void:
#	# Movement using the joystick output:
#	if joystickLeft and joystickLeft.is_pressed():
#		position += joystickLeft.get_output() * speed * delta
	
	# Movement using Input functions:
	move_vector = Vector2.ZERO
	move_vector.x = Input.get_axis("ui_left", "ui_right")
	move_vector.y = Input.get_axis("ui_up", "ui_down")
	if position.x < -170:
		position.x = -169
	if position.x > 280:
		position.x = 279
	if position.y < -100:
		position.y = -99
	if position.y > 150:
		position.y = 149
	position += move_vector * speed * delta

