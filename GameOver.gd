extends Node2D


func _ready():
	RenderingServer.set_default_clear_color(Color.ROSY_BROWN)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$GameOvertxt.text = "Game Over"
	$Score.text = "Score: " + str(Global.score)
	if $Restart.is_pressed():
		get_tree().change_scene_to_file("res://battlefield.tscn")
	elif $Menu.is_pressed():
		get_tree().change_scene_to_file("res://menu.tscn")
