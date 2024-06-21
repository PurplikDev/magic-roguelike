class_name AnchoredCamera
extends Camera2D

@export var actor: Entity

func _process(delta):
	position = lerp(position, get_local_mouse_position() / 4, actor.LERP_SPEED * delta)
