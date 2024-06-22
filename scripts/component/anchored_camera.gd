class_name AnchoredCamera
extends Camera2D

@export var actor: Entity

@export var strength: float
@export var lerp_speed: float

func _process(delta):
	position = lerp(position, get_local_mouse_position() / strength, lerp_speed * delta)
