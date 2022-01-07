extends Sprite


# Declare member variables here. Examples:
var middle : Texture = preload("res://images/Controller/joy/sprite_joy0.png")
var topright : Texture = preload("res://images/Controller/joy/sprite_joy1.png")
var bottomleft : Texture = preload("res://images/Controller/joy/sprite_joy2.png")
var bottomright : Texture = preload("res://images/Controller/joy/sprite_joy3.png")
var topleft : Texture = preload("res://images/Controller/joy/sprite_joy4.png")
var right : Texture = preload("res://images/Controller/joy/sprite_joy5.png")
var left : Texture = preload("res://images/Controller/joy/sprite_joy6.png")
var up : Texture = preload("res://images/Controller/joy/sprite_joy7.png")
var down : Texture = preload("res://images/Controller/joy/sprite_joy8.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	texture = middle


func _input(event):
	if PlayerData.players[0].device != -1:
		var x = Input.get_joy_axis(PlayerData.players[0].device,JOY_AXIS_2)
		var y = Input.get_joy_axis(PlayerData.players[0].device,JOY_AXIS_3)
		if x>=0.5:
			if y<=-0.5:
				texture = topright
			elif y>=0.5:
				texture = bottomright
			else:
				texture = right
		elif x<=-0.5:
			if y<=-0.5:
				texture = topleft
			elif y>=0.5:
				texture= bottomleft
			else:
				texture = left
		elif y<=-0.5:
			texture = up
		elif y>=0.5:
			texture = down
		else:
			texture =middle

