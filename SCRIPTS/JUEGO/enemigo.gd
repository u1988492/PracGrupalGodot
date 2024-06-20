extends CharacterBody2D

const SPEED = 50.0
var player = null
var dir = "E"

var chasing = false #true if the player is close enough to be detected by the enemy
var on_reach = false #true if the player is close enough to be hit
var cooldown = false #true if the enemy is on cooldown right after attacking

func _physics_process(delta):
	enemy_movement(delta)
	attack()

func enemy():
	pass #funcion vacia para ser detectado por el player

func enemy_movement(_delta):
	if chasing:
		#position += (player.position - position)/SPEED
		if (player.position.x - position.x) < 0:
			position += ((player.position + Vector2(29,0)) - position)/SPEED
			dir = "W"
			$AnimatedSprite2D.flip_h = true
		else:
			position += ((player.position - Vector2(29,0)) - position)/SPEED
			dir = "E"
			$AnimatedSprite2D.flip_h = false
				
	if !global.enemy_attacking:
		if chasing:
			play_animation(1)
		else:
			play_animation(0)	
	move_and_collide(Vector2(0,0))

func play_animation(movement):
	var animation = $AnimatedSprite2D
	if movement == 1:
		if global.enemy_attacking == false:
			animation.play("walk")
	elif movement == 0:
		animation.play("idle")

func _on_area_deteccion_body_entered(body):
	if body.has_method("player"):
		player = body
		chasing = true

func _on_area_deteccion_body_exited(body):
	if body.has_method("player"):
		player = null
		chasing = true

func _on_area_ataque_body_entered(body):
	if body.has_method("player"):
		on_reach = true

func _on_area_ataque_body_exited(body):
	if body.has_method("player"):
		on_reach = false

func attack():
	if on_reach and not global.enemy_attacking and not cooldown:
		global.enemy_attacking = true
		$AttackTimer.start()
		$AnimatedSprite2D.play("attack")

func _on_attack_timer_timeout():
	$AttackTimer.stop()
	global.enemy_attacking = false
	cooldown = true
	$CooldownTimer.start()

func _on_cooldown_timer_timeout():
	$CooldownTimer.stop()
	cooldown = false

func take_damage():
	pass


