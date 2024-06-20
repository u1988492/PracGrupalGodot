extends Control

@onready var healthbar = %healthbar
var maxHealth = 30
var playerHealth: int = maxHealth


# Called when the node enters the scene tree for the first time.
func _ready():
	healthbar.value = (maxHealth*100)/maxHealth


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	playerHealth = global.playerHealth
	healthbar.value = (playerHealth * 100) / maxHealth
