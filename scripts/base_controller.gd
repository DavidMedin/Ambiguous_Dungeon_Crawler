extends KinematicBody2D
class_name BaseController
tool
export var device_id : int

onready var health_bar = $health_bar
export var health = 3 setget set_health
func _ready():
	set_health(health)
func set_health(h):
	if not health_bar:
		health_bar = $health_bar #bruh.
		#might be needed because this script is loaded (onready) before
		#it's children (like health_bar) is.
	health_bar.rect_size.x = h
	health_bar.rect_position.x = -h/2
	health = h
