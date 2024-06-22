extends Resource
class_name SavedGame

#path a la escena de la sala guardada
@export var room_path: String

@export var player_position: Vector2
@export var player_health: float

#info de los elementos dinámicos de la sala
@export var saved_data:Array[SavedData] = []
