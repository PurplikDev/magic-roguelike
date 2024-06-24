class_name DamageFlashComponent
extends CanvasGroup

@export var flash_color: Color

var flash_tween: Tween

func flash():
	self_modulate = flash_color
	if flash_tween:
		flash_tween.kill()
	flash_tween = get_tree().create_tween()
	flash_tween.tween_property(self, "self_modulate", Color.WHITE, 0.25).set_ease(Tween.EASE_IN)
