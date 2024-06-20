extends Control

@onready var botones = %botones
@onready var transicion = $transicion/fadeanim


signal start_game()

func _ready():
	transicion.play("fadein")

func _on_play_pressed():
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://ESCENAS/JUEGO/juego.tscn")


func _on_load_pressed():
	pass # Replace with function body.

func _on_exit_pressed():
	get_tree().quit()

func _on_visibility_changed():
	if  visible:
		focus_button()
		

func focus_button():
	#if botones:
	#	var button: Button = botones.get_child(0)
	#	if button is Button:
	#		button.grab_focus()
	pass


