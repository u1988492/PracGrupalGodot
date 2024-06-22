extends Control

@onready var healthbar = %healthbar

# Called when the node enters the scene tree for the first time.
func _ready():
	healthbar.value = (global.maxHealth*100)/global.maxHealth
	$barra/llave.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	healthbar.value = (global.playerHealth * 100) / global.maxHealth
	show_key()

func show_key():
	if not global.has_key:
		$barra/llave.visible = false
	else:
		$barra/llave.visible = true
