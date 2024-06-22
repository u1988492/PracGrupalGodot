extends Node2D
class_name Juego
#global script, call variables as "global"

@export var enemy_attacking = false #true if an enemy is attacking the player
@export var player_attacking = false #true if the lantern light is hurting an enemy

@export var maxHealth = 100
var playerPositon
@export var has_key = false
@onready var playerHealth:float = maxHealth:
	set(value):
		playerHealth = value

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
