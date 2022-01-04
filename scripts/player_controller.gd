extends KinematicBody2D

var speed = 2500
const floor_index = 8 # index into tilemap

var device_id = PlayerData.players[0].device

func _process(delta):
	if device_id != -1:
		var dead = 0.25
		var vel = Vector2(0,0)
		var tmp : float =  Input.get_joy_axis(device_id,JOY_AXIS_0)
		if abs(tmp) > dead:
			vel += Vector2(tmp,0)
		tmp =   Input.get_joy_axis(device_id,JOY_AXIS_1)
		if abs(tmp) > dead:
			vel += Vector2(0,tmp)
		move_and_slide(vel * delta * speed)
		if vel != Vector2(0,0):
			rotation = vel.angle()