extends Area2D

func _on_body_entered(_body):
	if global.playerHealth < global.maxHealth:
		global.playerHealth += 15
		$AnimationPlayer.play("Recoger")

func potion():
	pass
