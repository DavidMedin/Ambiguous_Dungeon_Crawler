extends KinematicBody2D

var speed = 50
const floor_index = 8 # index into tilemap

var device_id = PlayerData.players[0].device

onready var dash_time : Timer = $"dash_time"
var can_input = true
var velocity = Vector2(0,0)

func _ready():
	dash_time.connect("timeout",self,"on_dash_end")

func on_dash_end():
	print("dash has ended")
	can_input = true

func get_joy_direction():
	var dead = 0.25
	var vel = Vector2(0,0)
	var tmp : float =  Input.get_joy_axis(device_id,JOY_AXIS_0)
	if abs(tmp) > dead:
		vel += Vector2(tmp,0)
	tmp =   Input.get_joy_axis(device_id,JOY_AXIS_1)
	if abs(tmp) > dead:
		vel += Vector2(0,tmp)
	return vel

func _physics_process(delta):
	if device_id != -1 and can_input:
		var vel = get_joy_direction()
		move_and_slide(vel * speed)
		velocity = vel
		if vel != Vector2(0,0):
			rotation = vel.angle()
	else:
		move_and_slide(velocity,Vector2(0,0),true)
		
		if get_slide_count() != 0:
			velocity = Vector2(0,0)
			can_input = true
			dash_time.stop()

func _input(event):
	if event is InputEventJoypadButton:
		if event.is_pressed() and event.button_index == JOY_XBOX_A:
			# dash
			var vel = get_joy_direction()
			velocity = vel * speed * 2
			# disable other movement input
			can_input = false
			dash_time.start(0.5)