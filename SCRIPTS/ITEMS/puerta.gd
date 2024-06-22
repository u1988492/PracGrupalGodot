extends StaticBody2D

func _on_open_door_body_entered(body):
	if body.has_method("player") and global.has_key:
		global.has_key = false
		$AnimationPlayer.play("open")
