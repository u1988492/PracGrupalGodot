extends TileMap
class_name Entrada

@export var next_room = "sala1" 
@export var next_door = "door_to_entrada"
@export_file("*.tscn") var next_level:String

func _on_detection_to_sala_1_body_entered(body):
	if body is Player:
		get_parent().change_room(next_room, next_door)
