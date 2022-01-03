extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(speed * delta * Input.get_action_strength("move_right"),0)
	position -= Vector2(speed * delta * Input.get_action_strength("move_left"),0)
	position -= Vector2(0,speed * delta * Input.get_action_strength("move_up"))
	position += Vector2(0,speed * delta * Input.get_action_strength("move_down"))
	if Input.is_action_pressed("ui_down"):
		position += Vector2(0,speed * delta)
	if Input.is_action_pressed("ui_left"):
		position -= Vector2(speed * delta,0)
	if Input.is_action_pressed("ui_up"):
		position -= Vector2(0,speed * delta)
	
