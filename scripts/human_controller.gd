extends BaseController
tool # required for BaseController's 'tool' keyword to work

var speed = 50
var can_input = true
var velocity = Vector2(0,0)
#onready var health_bar = $"health_bar"

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

# func _input(event):
# 	if event is InputEventJoypadButton:
# 		if event.is_pressed() and event.button_index == JOY_XBOX_A:
# 			pass
