extends Area2D

var lantern_on = false #true when the lantern is on

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	on_and_off(delta)

func on_and_off(_delta):
	if Input.is_action_just_pressed("linterna"):
		$AudioStreamPlayer2D.play(0)
		if lantern_on:
			hide()
			lantern_on = false
		else:
			show()
			lantern_on = true
		

func _on_body_entered(body):
	pass # Replace with function body.


func _on_body_exited(body):
	pass # Replace with function body.
