extends Node2D

onready var players : Array
func _ready():
	players.resize(4)
	for i in range(4):
		players[i] = Player.new()
