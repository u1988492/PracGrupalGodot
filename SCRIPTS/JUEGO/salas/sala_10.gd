extends TileMap

@export var next_room_1 = "final"
@export var next_room_2 = "sala9"
@export var next_door = "door_to_sala10"
 

func _on_detection_to_final_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room_1, next_door)

func _on_detection_to_sala_9_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room_2, next_door)
