extends TileMap

@export var next_room_1 = "sala4"
@export var next_room_2 = "sala1"
 

func _on_detection_to_sala_4_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room_1)

func _on_detection_to_sala_1_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room_2)
