extends Control


func _on_detective_update_ui():
	$CurrentHealth.text  = "Current health: " + str(global.playerHealth)
	$CurrentPos.text = "Current position: " + str(global.playerPositon)
