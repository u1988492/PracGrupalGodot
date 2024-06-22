extends CharacterBody2D

var speed = 75.0
var player = null
var dir = "E"
var maxHealth = 50
var health = 50
var damage = 5
var random
@onready var transicion = $transicion/fadeanim

var chasing = false #true if the player is close enough to be detected by the enemy
var on_reach = false #true if the player is close enough to be hit
var cooldown = false #true if the enemy is on cooldown right after attacking
var on_light = false #true if the enemy is on the lantern's light.
var damage_cooldown = false #true if the enemy is on cooldown after receiving damage
var dead = false

func _physics_process(delta):
	if not dead:
		enemy_movement(delta)
		attack()
		take_damage()
	else:
		death()

func enemy():
	pass #funcion vacia para ser detectado por el player

func enemy_movement(_delta):
	if chasing:
		if (player.position.x - position.x) < 0:
			position += ((player.position + Vector2(29,0)) - position)/speed
			dir = "W"
			$AnimatedSprite2D.flip_h = true
		else:
			position += ((player.position - Vector2(29,0)) - position)/speed
			dir = "E"
			$AnimatedSprite2D.flip_h = false
				
	if not global.enemy_attacking and not global.player_attacking:
		if chasing:
			play_animation(1)
		else:
			play_animation(0)	
	move_and_collide(Vector2(0,0))

func play_animation(movement):
	var animation = $AnimatedSprite2D
	if movement == 1:
		if not global.enemy_attacking and not global.player_attacking:
			if not health <= maxHealth/2:
				animation.play("walk")
			else:
				animation.play("fly")
	elif movement == 0:
		animation.play("idle")

func _on_detection_timer_timeout():
	$Timers/DetectionTimer.stop()
	$AreaDeteccion/CollisionShape2D.disabled = false

func _on_area_deteccion_body_entered(body):
	if body.has_method("player"):
		player = body
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
		random = randi_range(1,2)
		$Timers/AttackTimer.start()
		if random == 1:
			$AnimatedSprite2D.play("attack_1")
		else:
			$AnimatedSprite2D.play("attack_2")
		$attack.play(0)

func _on_attack_timer_timeout():
	$Timers/AttackTimer.stop()
	global.enemy_attacking = false
	cooldown = true
	$Timers/CooldownTimer.start()

func _on_cooldown_timer_timeout():
	$Timers/CooldownTimer.stop()
	cooldown = false

func _on_area_ataque_area_entered(area):
	if area.has_method("lantern"):
		on_light = true

func _on_area_ataque_area_exited(area):
	if area.has_method("lantern"):
		on_light = false

func take_damage():
	if on_light and global.player_attacking and not damage_cooldown:
		health -= damage
		damage_cooldown = true
		$Timers/DamageCooldown.start()
		$AnimatedSprite2D.play("hurt")
		global.player_attacking = false
		if health <= maxHealth/2:
			speed = 50.0
		if health <= 0:
			dead = true

func _on_damage_cooldown_timeout():
	$Timers/DamageCooldown.stop()
	damage_cooldown = false

func death():
	if dead:
		$AnimationPlayer.play("death")
		win_screen()

func win_screen():
	transicion.play("fadeoutlong")
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://ESCENAS/UI/win.tscn")
