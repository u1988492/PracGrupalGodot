extends Area2D

@export var inventory := preload("res://ESCENAS/UI/inventoryUI.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(viewport, event, shape_idx):
	get_tree().change_scene_to_packed(inventory)
