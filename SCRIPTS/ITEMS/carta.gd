extends Area2D

@export var carta_numero: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_body_entered(_body):
	print("Has recogido una carta")
	$AnimationPlayer.play("recoger")
