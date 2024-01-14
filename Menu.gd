extends Node2D

func _ready():
	RenderingServer.set_default_clear_color(Color.ROSY_BROWN)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Start.is_pressed():
		get_tree().change_scene_to_file("res://battlefield.tscn")
	
	elif $Quit.is_pressed():
		get_tree().quit()
