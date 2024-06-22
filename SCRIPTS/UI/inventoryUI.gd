extends Control

var player: Node

var n_letters = 4
var letters_array = [false, false, false, false]


@export var c1 := load("res://ESCENAS/UI/carta1.tscn")
@export var c2:= load("res://ESCENAS/UI/carta2.tscn")
@export var c3:= load("res://ESCENAS/UI/carta3.tscn")
@export var c4:= load("res://ESCENAS/UI/carta4.tscn")


func _ready():
	get_tree().set_group("letter", "visible", false)


func _input(event):
	if event.is_action_pressed("inventario"):
		visible = !visible
		if visible:
			update_inventory_display()

func update_inventory_display():
	pass
	#var photos = player.inventory.photos
	#var letters = player.inventory.letters

	#for i in range(2):
		#var photo_label = $photoscontainer/photosgrid.get_child(i)
		#if i < photos.size():
			#photo_label.text = photos[i]
			#photo_label.visible = true
		#else:
			#photo_label.visible = false

	#for i in range(4):
		#var letter_label = $letterscontainer/lettersgrid.get_child(i)
		#if i < letters.size():
			#letter_label.text = letters[i]
			#letter_label.visible = true
		#else:
			#letter_label.visible = false


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
