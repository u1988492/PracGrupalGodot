extends Control

@onready var botones = %botones

signal start_game()

func _ready():
	focus_button()

func _on_play_pressed():
	start_game.emit()
	hide()


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


