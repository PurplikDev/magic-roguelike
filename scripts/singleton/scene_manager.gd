extends Node

@onready var color_rect = $CanvasLayer/ColorRect

var transition_tween: Tween

func transition_to_scene(path: String):
	if transition_tween:
		transition_tween.kill()
	transition_tween = get_tree().create_tween()
	transition_tween.tween_property(color_rect, "color", Color(0.1294, 0.1294, 0.1294, 1), 0.75)
	transition_tween.tween_callback(func(): change_scene(path))
	transition_tween.tween_property(color_rect, "color", Color(0.1294, 0.1294, 0.1294, 0), 0.75)

func change_scene(path: String):
	get_tree().change_scene_to_file(path)
