extends Control

@onready var botones = %botones

@onready var SFX_BUS_ID = AudioServer.get_bus_index("SFX")
@onready var MUSIC_BUS_ID = AudioServer.get_bus_index("MUSIC")
@onready var transicion = $transicion/fadeanim


signal start_game()

func _ready():
	pass
	

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = !visible

func focus_button():
	#if botones:
	#	var button: Button = botones.get_child(0)
	#	if button is Button:
	#		button.grab_focus()
	pass



func _on_play_pressed():
	visible = !visible

func _on_save_pressed():
	pass # Replace with function body.
	


func _on_exit_pressed():
	transicion.get_parent().get_node("ColorRect").color.a = 255
	transicion.play("fadeoutlong")
	await get_tree().create_timer(1.1).timeout
	get_tree().change_scene_to_file("res://ESCENAS/UI/MainMenu.tscn")


func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(MUSIC_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(MUSIC_BUS_ID,  value < .05)
	


func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(SFX_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(SFX_BUS_ID,  value < .05)
