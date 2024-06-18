extends CharacterBody2D


const speed = 300.0
var dir = "S"

func _physics_process(delta):
	player_movement(delta)

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

#NO USAMOS LA TRANSFORMACIÓN SIGUIENTE PUESTO QUE EL SPRITE QUE QUEREMOS USAR CONSTA DE SOLO 4 DIRECCIONES. LA GUARDAMOS POR SI ACABAMOS CAMBIANDO EL SCRIPT
#static func cart_to_iso(direction:Vector2) -> Vector2:
#	return Vector2(direction.x-direction.y, (direction.x+direction.y)/2)
