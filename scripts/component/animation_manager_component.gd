class_name AnimationManagerComponent
extends Node

@export var actor: Entity
@export var animated_sprites: Array[AnimatedSprite2D]

var direction: Vector2 = Vector2.ZERO

func _physics_process(delta):
	if direction.length() > 0:
		if direction.x > 0:
			play("move_right")
		elif direction.x < 0:
			play("move_left")
		elif direction.y > 0:
			play("move_down")
		elif direction.y < 0:
			play("move_up")
		else:
			play("idle")
	else:
		play("idle")

func play(animation_name: String):
	for sprite in animated_sprites:
		if sprite != null && sprite.sprite_frames != null:
			sprite.play(animation_name)
