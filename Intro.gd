extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	RenderingServer.set_default_clear_color(Color.FLORAL_WHITE)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_transfer_to_menu_timer_timeout():
	get_tree().change_scene_to_file("res://menu.tscn")
