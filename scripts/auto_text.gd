tool
extends RichTextLabel
onready var font = theme.default_font
export(String) var auto_text setget set_string
export(Vector2) var target = Vector2(38,10)
export(Vector2) var offset = Vector2(2,0)
export(int) var length
func set_string(new_str):
	if font == null:
		font = theme.default_font
	if font is DynamicFont:
		auto_text = new_str
		set_text(auto_text)
		# get length
		length = font.get_string_size(auto_text).x
		rect_position = target
	
func _ready():
	set_string(auto_text)
#func _process(delta):
#	set_string(auto_text)
func _draw():
	draw_line(Vector2(length / 2,-5),Vector2(length/2,10) ,Color(1,0,0))

#	draw_line(Vector2(line_offset_x,1),Vector2(length,1),Color(1,0,0),1.0001)
