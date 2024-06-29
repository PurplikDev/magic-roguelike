class_name Caster
extends Node2D

@onready var marker_2d = $Sprite2D/Marker2D

var look_at_pos: Vector2

func _physics_process(_delta):
	look_at(look_at_pos)
