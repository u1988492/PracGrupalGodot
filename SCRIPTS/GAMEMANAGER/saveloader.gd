extends Node
class_name SaveLoader

@onready var player = %Detective

func save_game():
	
	var saved_game: SavedGame = SavedGame.new()
	saved_game.player_health = player.currentHealth
	saved_game.player_position = player.global_position
	ResourceSaver.save(saved_game, "user://savedgame.tres")

func load_game():
	var saved_game: SavedGame = load("user://savedgame.tres") as SavedGame
	player.global_position = saved_game.player_position
	player.currentHealth = saved_game.player_health 
