extends Control


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if Input.is_action_just_pressed("mouse_click"):
		print('click')
