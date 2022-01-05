extends Sprite

var speed=500
var up : Texture = preload("res://images/Controller/dpad/sprite_dpad2.png")
var down : Texture = preload("res://images/Controller/dpad/sprite_dpad4.png")
var left : Texture = preload("res://images/Controller/dpad/sprite_dpad3.png")
var right : Texture = preload("res://images/Controller/dpad/sprite_dpad1.png")
var none : Texture = preload("res://images/Controller/dpad/sprite_dpad0.png")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	texture= none


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if PlayerData.players[0].device != -1:
		if event is InputEventJoypadButton:
			if event.pressed and event.button_index == JOY_DPAD_UP:
				texture=up
			elif event.pressed and event.button_index == JOY_DPAD_DOWN:
					texture=down
			elif event.pressed and event.button_index == JOY_DPAD_RIGHT:
				texture=right
			elif event.pressed and event.button_index == JOY_DPAD_LEFT:
				texture=left
			else:
				texture=none
				
