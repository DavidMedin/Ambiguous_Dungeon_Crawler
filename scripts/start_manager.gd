extends HBoxContainer

onready var players : Array =  [$"Control/AButton",$"Control2/AButton",$"Control3/AButton",$"Control4/AButton"]
onready var timers : Array =  [$"Control/Timer",$"Control2/Timer",$"Control3/Timer",$"Control4/Timer"]
# var devices : Array = [-1,-1,-1,-1]
onready var start_timer : Timer = $"Control/CharacterBar/start_mask/TopStart/AButton/Timer"
onready var start_button : Sprite = $"Control/CharacterBar/start_mask/TopStart/AButton"

var butt_pressed : Texture = load("res://images/a_button_pressed.png")
var butt_unpressed : Texture = load("res://images/a_button.png")

onready var start_anime = $"Control/CharacterBar/start_mask/TopStart"

var game_scene = preload("res://scenes/game_scene.tscn")

func _ready():
	for t in range(4):
		timers[t].connect("timeout",self,"on_timer_done",[t])
	start_timer.connect("timeout",self,"on_start_done")

func on_start_done():
	start_button.texture = butt_unpressed
	get_tree().change_scene_to(game_scene)
	
func on_timer_done(player):
	# players[player].texture = butt_unpressed
	players[player].visible = false
	if player == 0:
		start_anime.start_anime()


func _input(event):
	if event is InputEventJoypadButton:
		if event.pressed and event.button_index == JOY_XBOX_A:
			#check to see if it is player one (they want to start the game)
			if event.device == PlayerData.players[0].device:
				#start the game
				start_button.texture = butt_pressed
				start_timer.start(.2)
				return
			for i in range(4):#iterate through devices
				if PlayerData.players[i].device == event.device:
					#This device is already registered

					break
				if PlayerData.players[i].device == -1:
					PlayerData.players[i].device = event.device
					PlayerData.players[i].character = Characters__.Characters.rat
					print(Input.get_joy_name(PlayerData.players[i].device)," (",event.device,") has connected!")

					# Set the button to be pressed for a frame
					players[i].texture = butt_pressed
					#start the timer
					timers[i].start(.2)
					
					
					# Show the "locked in" state
					break
				print("Multiplayer has not been implemented yet!")
				break
		if event.pressed and event.button_index == JOY_XBOX_X:
			var before = PlayerData.players[PlayerData.has_device(event.device)].character
			PlayerData.players[PlayerData.has_device(event.device)].character = wrapi(before-1,0,Characters__.Characters.size())
			get_tree().set_input_as_handled()
		if event.pressed and event.button_index == JOY_XBOX_B:
			var before = PlayerData.players[PlayerData.has_device(event.device)].character
			PlayerData.players[PlayerData.has_device(event.device)].character = wrapi(before+1,0,Characters__.Characters.size())
			get_tree().set_input_as_handled()
			
