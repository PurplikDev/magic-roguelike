class_name StatBar
extends Control

@export var color: Color

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var background_bar: ProgressBar = $BackgroundBar

var bar_tween: Tween

func _ready():
	progress_bar.self_modulate = color

func set_value(value: float):
	progress_bar.value = value
	if bar_tween:
		bar_tween.kill()
	bar_tween = get_tree().create_tween()
	bar_tween.tween_property(background_bar, "value", value, 0.25).set_ease(Tween.EASE_IN)

func set_max_value(value: float):
	progress_bar.max_value = value
	background_bar.max_value = value
