extends Node2D


@onready var fadeanim = $fadeanim


func play_fadein():
		fadeanim.play("fadein")
