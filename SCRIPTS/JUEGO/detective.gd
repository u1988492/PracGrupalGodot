extends CharacterBody2D

class_name Player

const speed = 300.0 #speed of the player's movement
var dir = "S" #direction in which the player moves and looks
var on_range = false #true when an enemy is close enough to hit the player

#ajustar valor de la salud que da una poción
@export var potionhealth = 1
@export var maxHealth = 30
@onready var currentHealth: int = maxHealth

@export var has_key = false #cambiar cuando recoge o usa llave

signal healthChanged #emitir señal cuando cambia salud a barra de progreso

#actualizar salud al tomar pocióm
func increaseHealth():
	if currentHealth>=maxHealth: return
	currentHealth += potionhealth
	healthChanged.emit()

func _physics_process(delta):
	player_movement(delta)
	take_damage()

func player():
	pass #funcion vacia para ser detectado por el enemigo

func player_movement(_delta):
	var direction := Input.get_vector("caminar_W", "caminar_E", "caminar_N", "caminar_S")
	if Input.is_action_pressed("caminar_N"):
		dir = "N"
		play_animation(1)
		self.velocity = direction * speed
	elif Input.is_action_pressed("caminar_S"):
		dir = "S"
		play_animation(1)
		self.velocity = direction * speed
	elif Input.is_action_pressed("caminar_E"):
		dir = "E"
		play_animation(1)
		self.velocity = direction * speed
	elif Input.is_action_pressed("caminar_W"):
		dir = "W"
		play_animation(1)
		self.velocity = direction * speed
	else:
		play_animation(0)
		self.velocity = Vector2.ZERO
	
	move_and_slide()

func play_animation(movement):
	var animation = $AnimatedSprite2D
	if dir == "N":
		if movement == 1:
			animation.play("caminar_N")
		elif movement == 0:
			animation.play("idle_N")
	elif dir == "S":
		if movement == 1:
			animation.play("caminar_S")
		elif movement == 0:
			animation.play("idle_S")
	elif dir == "E":
		if movement == 1:
			animation.play("caminar_E")
		elif movement == 0:
			animation.play("idle_E")
	elif dir == "W":
		if movement == 1:
			animation.play("caminar_W")
		elif movement == 0:
			animation.play("idle_W")

func _on_area_ataque_body_entered(body):
	if body.has_method("enemy"):
		on_range = true

func _on_area_ataque_body_exited(body):
	if body.has_method("enemy"):
		on_range = false

func take_damage():
	if on_range and global.enemy_attacking:
		currentHealth -= 1
		print("Ouch!: ")
		print(currentHealth)
		healthChanged.emit()
		global.enemy_attacking = false
