extends Node2D

@onready var transicion = $transicion/fadeanim

# Called when the node enters the scene tree for the first time.
func _ready():
	transicion.get_parent().get_node("ColorRect").color.a = 255
	transicion.play("fadeinlong")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
