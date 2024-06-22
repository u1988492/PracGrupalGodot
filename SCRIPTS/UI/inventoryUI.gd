extends Control

var n_letters = 4
var letters_array = [false, false, false, false]

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

#func _on_photo_1_pressed():
#	pass

#func _on_photo_2_pressed():
#	pass

func _on_letter_1_pressed():
	$Cartas/Carta1.visible = true


func _on_letter_2_pressed():
	$Cartas/Carta2.visible = true


func _on_letter_3_pressed():
	$Cartas/Carta3.visible = true


func _on_letter_4_pressed():
	$Cartas/Carta4.visible = true
