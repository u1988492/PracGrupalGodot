extends Area2D

func _on_body_entered(body):
	$AnimationPlayer.play("Recoger")
	global.has_key = true

func key():
	pass
