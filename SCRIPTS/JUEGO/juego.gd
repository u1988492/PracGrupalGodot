extends Node2D

class_name Juego
#global script, call variables as "global"

var enemy_attacking = false #true if an enemy is attacking the player
var player_attacking = false #true if the lantern light is hurting an enemy

const maxHealth = 100
var playerHealth
var playerPositon
var has_key = false


# Called when the node enters the scene tree for the first time.
func _ready():
	playerHealth = maxHealth
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
