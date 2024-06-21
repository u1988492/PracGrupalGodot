extends CharacterBody2D

class_name Player

signal update_ui

const speed = 300.0 #speed of the player's movement
var dir = "S" #direction in which the player moves and looks
var on_range = false #true when an enemy is close enough to hit the player
var damage_cooldown = false
var inventory := preload("res://SCRIPTS/UI/inventorymanager.gd").new() #crear inventario

#ajustar valor de la salud que da una poción
@export var damage = 1
@export var potionhealth = 1
@export var maxHealth = 30
@onready var currentHealth: int = maxHealth

@export var has_key = false #cambiar cuando recoge o usa llave

#añadir items al inventario cuando se hayan recogido
func add_photo(photo_name: String):
	inventory.add_photo(photo_name)

func add_letter(letter_name: String):
	inventory.add_letter(letter_name)

#actualizar salud al tomar pocióm
func increaseHealth():
	pass
	
func _ready():
	global.playerHealth = currentHealth
	global.playerPositon = self.position

func _physics_process(delta):
	player_movement(delta)
	global.playerPositon = self.position
	take_damage()
	emit_signal("update_ui")

func player():
	pass #funcion vacia para ser detectado por el enemigo

func player_movement(_delta):
	var direction := Input.get_vector("caminar_W", "caminar_E", "caminar_N", "caminar_S")
	if Input.is_action_pressed("caminar_N"):
		if not $Caminar.playing:
			$Caminar.play(0)
		dir = "N"
		play_animation(1)
		self.velocity = direction * speed
	elif Input.is_action_pressed("caminar_S"):
		if not $Caminar.playing:
			$Caminar.play(0)
		dir = "S"
		play_animation(1)
		self.velocity = direction * speed
	elif Input.is_action_pressed("caminar_E"):
		if not $Caminar.playing:
			$Caminar.play(0)
		dir = "E"
		play_animation(1)
		self.velocity = direction * speed
	elif Input.is_action_pressed("caminar_W"):
		if not $Caminar.playing:
			$Caminar.play(0)
		dir = "W"
		play_animation(1)
		self.velocity = direction * speed
	else:
		$Caminar.stop()
		play_animation(0)
		self.velocity = Vector2.ZERO
	
	move_and_slide()
	rotate_lantern()

func rotate_lantern():
	if dir == "S":
		$Linterna.set_rotation_degrees(90)
	elif dir == "W":
		$Linterna.set_rotation_degrees(180)
	elif dir == "N":
		$Linterna.set_rotation_degrees(270)
	elif dir == "E":
		$Linterna.set_rotation_degrees(0)

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
	if on_range and global.enemy_attacking and not damage_cooldown:
		currentHealth -= damage
		damage_cooldown = true
		$DamageCooldown.start()
		$AnimationPlayer.play("hit")
		global.playerHealth = currentHealth
		global.enemy_attacking = false

func _on_damage_cooldown_timeout():
	$DamageCooldown.stop()
	damage_cooldown = false
