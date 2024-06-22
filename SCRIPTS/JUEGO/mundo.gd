extends Node2D

@onready var transicion = $transicion/fadeanim
@onready var player = $Detective
@onready var camera = player.get_node("Camera2D")

@export var room_scenes = {
	"entrada": load("res://ESCENAS/JUEGO/entrada.tscn"),
	"sala1": load("res://ESCENAS/JUEGO/sala_1.tscn"),
	"sala2": load("res://ESCENAS/JUEGO/sala_2.tscn"),
	"sala3": load("res://ESCENAS/JUEGO/sala_3.tscn"),
	"sala4": load("res://ESCENAS/JUEGO/sala_4.tscn"),
	"sala5": load("res://ESCENAS/JUEGO/sala_5.tscn"),
	"sala6": load("res://ESCENAS/JUEGO/sala_6.tscn"),
	"sala7": load("res://ESCENAS/JUEGO/sala_7.tscn"),
	"sala8": load("res://ESCENAS/JUEGO/sala_8.tscn"),
	"sala9": load("res://ESCENAS/JUEGO/sala_9.tscn"),
	"sala10": load("res://ESCENAS/JUEGO/sala_10.tscn"),
	"sala11": load("res://ESCENAS/JUEGO/sala_11.tscn"),
	"final": load("res://ESCENAS/JUEGO/final.tscn")
}

var current_room = ""

var start_position = ""

var player_start_positions = {
	"entrada": {
		"door_to_sala1": Vector2(247, 102)
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
		"door_to_sala7": Vector2(42, 199),
		"door_to_sala11": Vector2(168, -33)
	},
	"sala9": {
		"door_to_sala7": Vector2(128, 379),
		"door_to_sala10": Vector2(446, 88)
	},
	"sala10": {
		"door_to_sala9": Vector2(33, 150),
		"door_to_final": Vector2(552, -60)
	},
	"sala11": {
		"door_to_sala8": Vector2(39, 111)
	},
	"final": {
		"door_to_sala10": Vector2(361, 474)
	},
}

var camera_limits = {
	"entrada": {
		"left": -64,
		"top": -112,
		"right": 528,
		"bottom": 352
	},
	"sala1": {
		"left": -79.592,
		"top": -63,
		"right": 415.867,
		"bottom": 304
	},
	"sala2": {
		"left": 31,
		"top": 33,
		"right": 512,
		"bottom": 448
	},
	"sala3": {
		"left": 17,
		"top": -32,
		"right": 432,
		"bottom": 415
	},
	"sala4": {
		"left": 17,
		"top": -16,
		"right": 608,
		"bottom": 447
	},
	"sala5": {
		"left": 16,
		"top": 0,
		"right": 624,
		"bottom": 496
	},
	"sala6": {
		"left": -16,
		"top": -31,
		"right": 496,
		"bottom": 368
	},
	"sala7": {
		"left": 0,
		"top": -32,
		"right": 704,
		"bottom": 336
	},
	"sala8": {
		"left": -16,
		"top": -175,
		"right": 336,
		"bottom": 367
	},
	"sala9": {
		"left": -15,
		"top": -112,
		"right": 496,
		"bottom": 432
	},
	"sala10": {
		"left": 17,
		"top": -112,
		"right": 672,
		"bottom": 240
	},
	"sala11": {
		"left": -16,
		"top": -32,
		"right": 528,
		"bottom": 319
	},
	"final": {
		"left": 112,
		"top": 128,
		"right": 608,
		"bottom": 512
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
	
	# Ajustar los límites de la cámara
	set_camera_limits(room_name)

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

func set_camera_limits(room_name):
	if camera_limits.has(room_name):
		var limits = camera_limits[room_name]
		camera.limit_left = limits.left
		camera.limit_top = limits.top
		camera.limit_right = limits.right
		camera.limit_bottom = limits.bottom
	else:
		print("No hay límites de cámara definidos para: ", room_name)

