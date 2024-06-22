extends Node
class_name SaveLoader

@onready var player = %Detective
@onready var juego = $"../.."

func save_game():
	
	var saved_game: SavedGame = SavedGame.new()
	
	saved_game.room_path = juego.get_current_room_path()
	
	saved_game.player_health = player.currentHealth
	saved_game.player_position = player.global_position
	
	#guardar info de los elementos dinamicos de la sala
	var saved_data:Array[SavedData] = []
	saved_game.saved_data = saved_data
	
	
	ResourceSaver.save(saved_game, "user://savedgame.tres")

func load_game():
	var saved_game: SavedGame = load("user://savedgame.tres") as SavedGame
	
	#cargar sala guardada
	await juego.load_room(saved_game.room_path)
	
	#cargar pos y vida jugador
	player.global_position = saved_game.player_position
	player.currentHealth = saved_game.player_health 
