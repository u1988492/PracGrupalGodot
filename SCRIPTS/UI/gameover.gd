extends Control

@onready var transicion = $transicion/fadeanim

func _on_tryagain_pressed():
	transicion.play("fadeout")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://ESCENAS/JUEGO/juego_1.tscn")


func _on_exit_pressed():
	transicion.play("fadeout")
	await get_tree().create_timer(1.1).timeout
	get_tree().change_scene_to_file("res://ESCENAS/UI/MainMenu.tscn")
