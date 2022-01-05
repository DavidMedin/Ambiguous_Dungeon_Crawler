extends Sprite

var speed=500
var gbutt_pressed : Texture = preload("res://images/Controller/green/sprite_green1.png")
var gbutt_unpressed : Texture = preload("res://images/Controller/green/sprite_green0.png")

var rbutt_pressed : Texture = preload("res://images/Controller/red/sprite_red1.png")
var rbutt_unpressed : Texture = preload("res://images/Controller/red/sprite_red0.png")

var ybutt_pressed : Texture = preload("res://images/Controller/yellow/sprite_yellow1.png")
var ybutt_unpressed : Texture = preload("res://images/Controller/yellow/sprite_yellow0.png")

var bbutt_pressed : Texture = preload("res://images/Controller/blue/sprite_blue1.png")
var bbutt_unpressed : Texture = preload("res://images/Controller/blue/sprite_blue0.png")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if PlayerData.players[0].device != -1:
		if event is InputEventJoypadButton:
			if event.pressed and event.button_index == JOY_XBOX_A:
				$greenbutton.texture=gbutt_pressed
			else:
				$greenbutton.texture=gbutt_unpressed
			if event.pressed and event.button_index == JOY_XBOX_B:
				$redbutton.texture=rbutt_pressed
			else:
				$redbutton.texture=rbutt_unpressed
			if event.pressed and event.button_index == JOY_XBOX_X:
				$bluebutton.texture=bbutt_pressed
			else:
				$bluebutton.texture=bbutt_unpressed
			if event.pressed and event.button_index == JOY_XBOX_Y:
				$yellowbutton.texture=ybutt_pressed
			else:
				$yellowbutton.texture=ybutt_unpressed                     
		#if event is InputEventJoypadMotion:
			
#		var dead = 0.5
#		var vel = Vector2(0,0)
#		var tmp : float = speed * delta * Input.get_joy_axis(PlayerData.players[0].device,JOY_AXIS_0)
#		if abs(tmp) > dead*speed*delta:
#			vel += Vector2(tmp,0)
#		tmp =  speed * delta * Input.get_joy_axis(PlayerData.players[0].device,JOY_AXIS_1)
#		if abs(tmp) > dead*speed*delta:
#			vel += Vector2(0,tmp)
