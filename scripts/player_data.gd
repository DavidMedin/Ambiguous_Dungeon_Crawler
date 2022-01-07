extends Node2D

enum Characters{
	rat,human
}
onready var players : Array
# onready var choices : Array # the choices from the main menu

var viewport = null
# mapped with the Characters.Characters enum
var characters = [preload("res://scenes/rat.tscn"),preload("res://scenes/human.tscn")]

func _ready():
	players.resize(4)
	# choices.resize(4)
	for i in range(4):
		players[i] = Player.new()
	# choices[0] = Characters.rat
	# choices[1] = Characters.human

# return the player number who has the device 'device'
func has_device(device):
	for i in range(4):
		if players[i].device == device:
			return i
	printerr("improper use of has_device!")

func spawn_char(character,where):
	var ent = characters[character].instance()
	ent.transform = where
	if viewport:
		viewport.add_child(ent)
	else:
		print("attempted to spawn a character when viewport haden't been set!")
	return ent
	
func start_game():
	print("The game has started!")
	viewport = $"/root/Node2D/Camera2D/ViewportContainer/Viewport"
	var spawn_points = get_tree().get_nodes_in_group("spawner")
	for player in range(4):
		if players[player].device != -1:
			var p = randi() % (spawn_points.size() - 1)
			var point : Transform2D = spawn_points[p].transform
			spawn_points.remove(p)
			# create new character
			var ent = spawn_char(players[player].character,point)
			ent.device_id = players[player].device
			
		else: break
	if spawn_points.size() > 0:
		spawn_char(Characters.human,spawn_points[0].transform)
	else:
		print("no spawn points left!")
