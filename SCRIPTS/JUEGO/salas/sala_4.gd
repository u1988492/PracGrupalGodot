extends TileMap

@export var next_room_1 = "sala5"
@export var next_room_2 = "sala6"
@export var next_room_3 = "sala2"
@export var next_door = "door_to_sala4"
 

func _on_detection_to_sala_5_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room_1, next_door)

func _on_detection_to_sala_6_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room_2, next_door)


func _on_detection_to_sala_2_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room_3, next_door)
