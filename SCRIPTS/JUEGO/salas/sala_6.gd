extends TileMap

@export var next_room = "sala4"
@export var next_door = "door_to_sala6"
 

func _on_detection_to_sala_4_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room, next_door)
