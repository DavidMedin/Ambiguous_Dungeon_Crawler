extends BaseController
tool # required for BaseController's 'tool' keyword to work

enum DashState {waiting,dashing,timeout}
var timeout = 0.5
var dash_length = 0.4
var dash_state = DashState.waiting

var speed = 50
onready var dash_time : Timer = $"dash_time"
onready var test_area = $test_area
var velocity = Vector2(0,0)

func _ready():
	dash_time.connect("timeout",self,"on_dash_time")
	test_area.connect("body_entered",self,"on_dash_hit")

func on_dash_time():
	match dash_state:
		DashState.waiting:
			print("dash state machine problem")
		DashState.dashing:
			on_dash_end()
			dash_time.start(timeout)
		DashState.timeout:
			dash_state = DashState.waiting

func on_dash_end():
	dash_state = DashState.timeout
	set_collision_mask_bit(1,true)
	
	set_collision_layer_bit(1,true)
	set_collision_layer_bit(2,false)

func on_dash_hit(body):
	# we hit someone
	if dash_state == DashState.dashing:
		# with our dash
		body.health -= 1

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
	if device_id != -1 and dash_state != DashState.dashing:
		var vel = get_joy_direction()
		move_and_slide(vel * speed)
		velocity = vel
		if vel != Vector2(0,0):
			rotation = vel.angle()
			health_bar.rect_rotation = rad2deg(-rotation)
	else:
		#we are dashing
		move_and_slide(velocity,Vector2(0,0),true)
		if get_slide_count() > 0:
			velocity = Vector2(0,0)
			dash_time.stop()
			on_dash_end()
			dash_time.start(timeout)

func _input(event):
	if event is InputEventJoypadButton:
		if event.is_pressed() and event.button_index == JOY_XBOX_A and dash_state == DashState.waiting:
			# dash
			velocity = Vector2(cos(rotation),sin(rotation)) * speed * 2
			dash_time.start(dash_length)
			dash_state = DashState.dashing
			# disable other movement input
			set_collision_mask_bit(1,false)
			
			#move to the 3rd bit
			set_collision_layer_bit(1,false)
			set_collision_layer_bit(2,true)
