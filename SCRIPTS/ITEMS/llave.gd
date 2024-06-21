extends Area2D

func _on_body_entered(body):
	if not global.has_key:
		global.has_key = true
		$AnimationPlayer.play("Recoger")

func key():
	pass
