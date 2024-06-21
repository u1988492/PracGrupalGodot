extends TileMap

@export var next_room = "sala10"
@export var next_door = "door_to_final"
 

func _on_detection_to_sala_10_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room, next_door)
