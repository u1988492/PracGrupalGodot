extends CharacterBody2D

const SPEED = 25.0
var player = null
var chasing = false
var dir = "E"

var attacking = false

func _physics_process(delta):
	enemy_movement(delta)

func enemy():
	pass #funcion vacia para ser detectado por el player

func enemy_movement(_delta):
	if chasing:
		position += (player.position - position)/SPEED
		if (player.position.x - position.x) < 0:
			dir = "W"
			$AnimatedSprite2D.flip_h = true
		else:
			dir = "E"
			$AnimatedSprite2D.flip_h = false
				
	if !attacking:
		if chasing:
			play_animation(1)
		else:
			play_animation(0)	
	move_and_collide(Vector2(0,0))

func play_animation(movement):
	var animation = $AnimatedSprite2D
	if movement == 1:
		if attacking == false:
			animation.play("walk")
	elif movement == 0:
		animation.play("idle")

func _on_area_deteccion_body_entered(body):
	if body.has_method("player"):
		player = body
		chasing = true
