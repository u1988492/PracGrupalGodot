extends Area2D

var lantern_on = false #true when the lantern is on
var lantern_range = false #true when there is an enemy within the lantern's light

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	on_and_off(delta)
	attack()

func lantern():
	pass

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
	if body.has_method("enemy"):
		lantern_range = true
		print("enemy on range")

func _on_body_exited(body):
	if body.has_method("enemy"):
		lantern_range = false

func attack():
	if lantern_on and lantern_range:
		global.player_attacking = true
	else:
		global.player_attacking = false
