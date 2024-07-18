extends CanvasLayer

@onready var control = $Control
@onready var retry: Button = $Control/Retry
@onready var quit: Button = $Control/Quit

var tween: Tween

func display():
	if tween:
		tween.kill()
	tween = get_tree().create_tween()
	tween.tween_property(control, "modulate", Color(1, 1, 1, 1), 0.5).set_ease(Tween.EASE_OUT)
	tween.tween_callback(func():
		retry.disabled = false
		quit.disabled = false
		)


func _on_retry_pressed():
	SceneManager.transition_to_scene("res://scenes/game.tscn")

func _on_quit_pressed():
	SceneManager.transition_to_scene("res://scenes/ui/main_menu.tscn")
