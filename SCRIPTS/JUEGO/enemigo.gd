extends CharacterBody2D

const SPEED = 25.0
var player = null
var persiguiendo = false
var dir = "E"

var atacando = false

func _physics_process(delta):
	enemy_movement(delta)

func enemy_movement(_delta):
	if persiguiendo:
		position += (player.position - position)/SPEED
		if (player.position.x - position.x) < 0:
			dir = "W"
		else:
			dir = "E"
				
	if !atacando:  # Only play movement animations if not attacking
		if persiguiendo:
			play_animation(1)
		else:
			play_animation(0)	
	move_and_collide(Vector2(0,0))

func play_animation(movement):
	var animation = $AnimatedSprite2D
	
	if dir == "W":
		if movement == 1:
			if atacando == false:
				animation.play("caminar")
		elif movement == 0:
			animation.play("idle")
	elif dir == "E":
		if movement == 1:
			if atacando == false:
				animation.play("caminar")
		elif movement == 0:
			animation.play("idle")


func _on_area_deteccion_body_entered(body):
	player = body
	persiguiendo = true
