extends TileMap

@export var next_room = "sala8"
@export var next_door = "door_to_sala11"
 

func _on_detection_to_sala_8_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room, next_door)
