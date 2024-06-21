extends TileMap

@export var next_room_1 = "sala2"
@export var next_room_2 = "sala3"
 

func _on_detection_to_sala_2_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room_1)

func _on_detection_to_sala_3_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room_2)
