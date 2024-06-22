extends Control

var n_letters = 4
var letters_array = [false, false, false, false]


@export var c1 := load("res://ESCENAS/UI/carta1.tscn")
@export var c2:= load("res://ESCENAS/UI/carta2.tscn")
@export var c3:= load("res://ESCENAS/UI/carta3.tscn")
@export var c4:= load("res://ESCENAS/UI/carta4.tscn")


func _ready():
	for i in range(n_letters):
		$letterscontainer/lettersgrid.get_child(i).visible = false

func _input(event):
	if event.is_action_pressed("inventario"):
		visible = !visible
		if visible:
			update_inventory_display()

func update_inventory_display():
	for i in range(n_letters):
		$letterscontainer/lettersgrid.get_child(i).visible = letters_array[i]

func _on_photo_1_pressed():
	pass

func _on_photo_2_pressed():
	pass

func _on_letter_1_pressed():
	get_tree().change_scene_to_packed(c1)


func _on_letter_2_pressed():
	get_tree().change_scene_to_packed(c2)


func _on_letter_3_pressed():
	get_tree().change_scene_to_packed(c3)


func _on_letter_4_pressed():
	get_tree().change_scene_to_packed(c4)
