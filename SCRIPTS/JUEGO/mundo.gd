extends Node2D

@onready var transicion = $transicion/fadeanim
@onready var player = $Detective

@export var room_scenes = {
	"entrada": preload("res://ESCENAS/JUEGO/entrada.tscn"),
	"sala1": preload("res://ESCENAS/JUEGO/sala_1.tscn"),
	"sala2": preload("res://ESCENAS/JUEGO/sala_2.tscn"),
	"sala3": preload("res://ESCENAS/JUEGO/sala_3.tscn"),
	"sala4": preload("res://ESCENAS/JUEGO/sala_4.tscn"),
	"sala5": preload("res://ESCENAS/JUEGO/sala_5.tscn"),
	"sala6": preload("res://ESCENAS/JUEGO/sala_6.tscn"),
	"sala7": preload("res://ESCENAS/JUEGO/sala_7.tscn"),
	"sala8": preload("res://ESCENAS/JUEGO/sala_8.tscn"),
	"sala9": preload("res://ESCENAS/JUEGO/sala_9.tscn"),
	"sala10": preload("res://ESCENAS/JUEGO/sala_10.tscn"),
	"sala11": preload("res://ESCENAS/JUEGO/sala_11.tscn"),
	"final": preload("res://ESCENAS/JUEGO/final.tscn")
}

var current_room = ""

var start_position = ""

var player_start_positions = {
	"entrada": {
		"door_to_sala1": Vector2(395.927, 151.192)
	},
	"sala1": {
		"door_to_entrada": Vector2(18.903, 117), # Ajusta las posiciones según las necesidades
		"door_to_sala2": Vector2(199.974, 39),
		"door_to_sala3": Vector2(328.316, 184)
	},
	"sala2": {
		"door_to_sala1": Vector2(295, 398),
		"door_to_sala4": Vector2(281, 124)
	},
	"sala3": {
		"door_to_sala1": Vector2(86, 230)
	},
	"sala4": {
		"door_to_sala2": Vector2(318, 369),
		"door_to_sala5": Vector2(448, 88),
		"door_to_sala6": Vector2(483, 261)
	},
	"sala5": {
		"door_to_sala4": Vector2(462, 440),
		"door_to_sala7": Vector2(343, 65)
	},
	"sala6": {
		"door_to_sala4": Vector2(44, 192)
	},
	"sala7": {
		"door_to_sala5": Vector2(423, 294),
		"door_to_sala8": Vector2(662, 190),
		"door_to_sala9": Vector2(81, 56)
	},
	"sala8": {
		"door_to_entrada": Vector2(200, 300), # Ajusta las posiciones según las necesidades
		"door_to_sala2": Vector2(150, 400),
		"door_to_sala3": Vector2(100, 500)
	},
	"sala9": {
		"door_to_entrada": Vector2(200, 300), # Ajusta las posiciones según las necesidades
		"door_to_sala2": Vector2(150, 400),
		"door_to_sala3": Vector2(100, 500)
	},
	"sala10": {
		"door_to_entrada": Vector2(200, 300), # Ajusta las posiciones según las necesidades
		"door_to_sala2": Vector2(150, 400),
		"door_to_sala3": Vector2(100, 500)
	},
	"sala11": {
		"door_to_entrada": Vector2(200, 300), # Ajusta las posiciones según las necesidades
		"door_to_sala2": Vector2(150, 400),
		"door_to_sala3": Vector2(100, 500)
	},
	"final": {
		"door_to_entrada": Vector2(200, 300), # Ajusta las posiciones según las necesidades
		"door_to_sala2": Vector2(150, 400),
		"door_to_sala3": Vector2(100, 500)
	},
}

# Called when the node enters the scene tree for the first time.
func _ready():
	transicion.get_parent().get_node("ColorRect").color.a = 255
	transicion.play("fadeinlong")
	
	current_room = "entrada" # Empieza en la sala "entrada"
	load_room(current_room)

func load_room(room_name):
	# Eliminar la escena actual si existe
	if has_node("CurrentRoom"):
		var current_room_node = get_node("CurrentRoom")
		remove_child(current_room_node)
		current_room_node.queue_free()
	
	# Instanciar y agregar la nueva sala
	var room_scene = room_scenes[room_name].instantiate()
	room_scene.name = "CurrentRoom"
	add_child(room_scene)
	
# Mover al jugador a la posición adecuada
	move_player_to_start(room_name, start_position)

func change_room(next_room, door):
	if room_scenes.has(next_room):
		current_room = next_room
		start_position = door
		load_room(current_room)
	else:
		print("La sala no existe: ", next_room)

func move_player_to_start(room_name, door):
	if player_start_positions.has(room_name):
		if player_start_positions[room_name].has(door):
			player.position = player_start_positions[room_name][door]
		else:
			print("No hay una posición de inicio definida para la puerta: ", door)
	else:
		print("No hay una posición de inicio definida para: ", room_name)
