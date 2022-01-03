extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 500
var map : TileMap
const floor_index = 8 # index into tilemap

var device_id = -1

func _ready():
	map = get_node("/root/Node2D/TileMap")
	if map == null:
		printerr("Couldn't find TileMap in the scene tree!")

func _unhandled_input(event):
	if event is InputEventJoypadButton:
		if event.pressed and event.button_index == JOY_XBOX_A:
			device_id = event.device
			print("You are device: ",device_id)

func _process(delta):
	if device_id != -1:
		var dead = 0.5
		var vel = Vector2(0,0)
		var tmp : float = speed * delta * Input.get_joy_axis(device_id,JOY_AXIS_0)
		if abs(tmp) > dead*speed*delta:
			print(tmp)
			vel += Vector2(tmp,0)
		tmp =  speed * delta * Input.get_joy_axis(device_id,JOY_AXIS_1)
		if abs(tmp) > dead*speed*delta:
			print(tmp)
			vel += Vector2(0,tmp)
		move_and_slide(vel * delta * speed)
