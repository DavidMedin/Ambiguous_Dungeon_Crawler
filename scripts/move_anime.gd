extends Node2D

onready var tween = $"../Tween"

func start_anime():
	tween.interpolate_property(self,"position",Vector2(14,24),Vector2(14,1),1,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()
