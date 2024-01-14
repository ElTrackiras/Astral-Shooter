extends CanvasLayer


var score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Health.text = "Star's Health: " + str($"../Star".HEALTH)
	$Score.text = "Score: " + str(Global.score)
	
	if $"../Gun".ammo_count > 0:
		$Ammo.text = "Ammo: " + str($"../Gun".ammo_count)
	else:
		$Ammo.text = "RELOAD!"
