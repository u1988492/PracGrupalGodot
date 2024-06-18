extends CanvasLayer
class_name UI

@onready var main_menu = %MainMenu
signal start_game()



#actualizar contadores de llaves 
#actualizar salud al recibir daño
#actualizar salud al recoger poción

func _on_main_menu_start_game():
	start_game.emit()
