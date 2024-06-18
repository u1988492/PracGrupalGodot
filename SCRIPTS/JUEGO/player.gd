extends CharacterBody2D

class_name Player

#ajustar valor de la salud que da una poción
@export var potionhealth = 1
@export var maxHealth = 30
@onready var currentHealth: int = maxHealth

signal healthChanged #emitir señal cuando cambia salud a barra de progreso

#actualizar salud al tomar pocióm
func increaseHealth():
	if currentHealth>=maxHealth: return
	currentHealth += potionhealth
	healthChanged.emit()
	

func hurtbyenemy():
	healthChanged.emit()
