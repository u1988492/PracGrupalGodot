extends Control

var player: Node

var n_letters = 4
var letters_array = []


func create_inventory():
	pass

func _ready():
	pass

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
	pass # Replace with function body.

func _on_photo_2_pressed():
	pass # Replace with function body.

func _on_letter_1_pressed():
	pass # Replace with function body.


func _on_letter_2_pressed():
	pass # Replace with function body.	


func _on_letter_3_pressed():
	pass # Replace with function body.


func _on_letter_4_pressed():
	pass # Replace with function body.
