extends Node2D

@onready var transicion = $transicion/fadeanim

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

func change_room(next_room):
	if room_scenes.has(next_room):
		current_room = next_room
		load_room(current_room)
	else:
		print("La sala no existe: ", next_room)
