extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 500
var map : TileMap
const floor_index = 8 # index into tilemap

var corners : Line2D

# Called when the node enters the scene tree for the first time.
func _ready():
	map = get_node("/root/Node2D/TileMap")
	if map == null:
		printerr("Couldn't find TileMap in the scene tree!")
	# corners = get_node("corners")
	# if corners == null:
	# 	printerr("Cound't find corners in children!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# var old_pos = position
	var vel = Vector2(0,0)
	vel += Vector2(speed * delta * Input.get_action_strength("move_right"),0)
	vel -= Vector2(speed * delta * Input.get_action_strength("move_left"),0)
	vel -= Vector2(0,speed * delta * Input.get_action_strength("move_up"))
	vel += Vector2(0,speed * delta * Input.get_action_strength("move_down"))
	move_and_slide(vel * delta * speed)


	# for x in corners.points:
	# 	if map.get_cellv(map.world_to_map(position + x)) != floor_index:
	# 		position = old_pos
	# 		break
	

	# if Input.is_action_pressed("ui_down"):
	# 	position += Vector2(0,speed * delta)
	# if Input.is_action_pressed("ui_left"):
	# 	position -= Vector2(speed * delta,0)
	# if Input.is_action_pressed("ui_up"):
	# 	position -= Vector2(0,speed * delta)
	
