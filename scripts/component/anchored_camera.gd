class_name AnchoredCamera
extends Camera2D

@export var actor: Entity

@export var strength: float
@export var lerp_speed: float
@export var zoom_amount: float

@onready var current_zoom: float = zoom.x

func _process(delta):
	position = lerp(position, get_local_mouse_position() / strength, lerp_speed * delta)
	zoom = lerp(zoom, Vector2(current_zoom, current_zoom), lerp_speed * delta)

func zoom_in():
	current_zoom = clampf(current_zoom + zoom_amount, 2.5, 5.0)
	

func zoom_out():
		current_zoom = clampf(current_zoom - zoom_amount, 2.5, 5.0)
