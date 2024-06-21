extends TileMap

@export var next_room = "sala1" 


func _on_entrada_detection_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room)
