extends AnimatedSprite2D
var shooting_anim_cd = 0
var magazine = 7
var ammo_count = magazine
var reload_animate = 30
var hitbox_on = 0


# Called every frame. 'delta' is the elapsed time since the previous frame. 
func _process(_delta):
	shooting_anim_cd -= 1
	if $ReloadTimer.is_stopped():
		if shooting_anim_cd <= 0:
			play("Idle")
	hitbox_on -= 1
	if hitbox_on > 0:
		$"../Crosshair/CrosshairDamageBox".disabled = false
	else:
		$"../Crosshair/CrosshairDamageBox".disabled = true

var shot_con = 0
func _on_shootbutton_released():
	if ammo_count > 0:
		if shooting_anim_cd <= 0:
			ammo_count -= 1
			shooting_anim_cd = 25
			hitbox_on = 5
			play("shot")
			if shot_con == 0:
				$ShotSound.play()
				shot_con = 1
			else:
				$ShotSound2.play()
				shot_con = 0
			
	else:
		play("reload")
		$ReloadSound.play()
		$shootbutton.position.y = 2000
		$ReloadTimer.start()
	
	
func _on_reload_timer_timeout():
	print("Reload Done")
	ammo_count = magazine
	$ReloadTimer.stop()
	$shootbutton.position.y = 46
