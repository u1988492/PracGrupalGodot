extends TileMap

@export var next_room_1 = "sala7"
@export var next_room_2 = "sala4"
@export var next_door = "door_to_sala5"
 

func _on_detection_to_sala_7_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room_1, next_door)

func _on_detection_to_sala_4_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room_2, next_door)
