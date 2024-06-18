extends ProgressBar

@export var player: Player 

func _ready():
	pass

func update():
	value = player.currentHealth * 100 / player.maxHealth #porcentaje de la max salud
