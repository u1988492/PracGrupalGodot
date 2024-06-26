extends TileMap

@export var next_room_1 = "sala2"
@export var next_room_2 = "sala3"
@export var next_room_3 = "entrada"
@export var next_door = "door_to_sala1"
 

func _on_detection_to_sala_2_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room_1, next_door)

func _on_detection_to_sala_3_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room_2, next_door)

func _on_detection_to_entrada_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room_3, next_door)
