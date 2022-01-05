extends Sprite

var speed=500
var butt_pressed : Texture = load("res://images/a_button_pressed.png")
var butt_unpressed : Texture = load("res://images/a_button.png")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	texture= butt_unpressed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if PlayerData.players[0].device != -1:
		if event is InputEventJoypadButton:
			if event.pressed and event.button_index == JOY_XBOX_A:
				texture=butt_pressed
			else:
				texture=butt_unpressed
				
#		var dead = 0.5
#		var vel = Vector2(0,0)
#		var tmp : float = speed * delta * Input.get_joy_axis(PlayerData.players[0].device,JOY_AXIS_0)
#		if abs(tmp) > dead*speed*delta:
#			vel += Vector2(tmp,0)
#		tmp =  speed * delta * Input.get_joy_axis(PlayerData.players[0].device,JOY_AXIS_1)
#		if abs(tmp) > dead*speed*delta:
#			vel += Vector2(0,tmp)
