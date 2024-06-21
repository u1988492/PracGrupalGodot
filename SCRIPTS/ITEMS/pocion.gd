extends Area2D

func _on_body_entered(_body):
	if global.playerHealth < global.maxHealth:
		$AnimationPlayer.play("Recoger")

func potion():
	pass
