extends Control

@onready var texture_button = $TextureButton

var size_tween: Tween
var scale_tween: Tween

func _ready():
	texture_button.mouse_entered.connect(begin_effect)
	texture_button.mouse_exited.connect(end_effect)

func _process(delta):
	texture_button.rotation_degrees = rotation_degrees * -1

func begin_effect():
	if size_tween != null:
		size_tween.kill()
	
	if scale_tween != null:
		scale_tween.kill()
	
	size_tween = get_tree().create_tween()
	size_tween.tween_property(self, "size", Vector2(120, 0), 0.125)
	
	scale_tween = get_tree().create_tween()
	scale_tween.tween_property(texture_button, "scale", Vector2(1.5, 1.5), 0.125)

func end_effect():
	if size_tween != null:
		size_tween.kill()
	
	if scale_tween != null:
		scale_tween.kill()
	
	size_tween = get_tree().create_tween()
	size_tween.tween_property(self, "size", Vector2(90, 0), 0.125)
	
	scale_tween = get_tree().create_tween()
	scale_tween.tween_property(texture_button, "scale", Vector2(1.0, 1.0), 0.125)
