extends TileMap

@export var next_room_1 = "sala8"
@export var next_room_2 = "sala9"
@export var next_room_3 = "sala5"
@export var next_door = "door_to_sala7"
 

func _on_detection_to_sala_8_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room_1, next_door)

func _on_detection_to_sala_9_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room_2, next_door)


func _on_detection_to_sala_5_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room_3, next_door)
