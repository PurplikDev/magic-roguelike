extends Node2D

@onready var animation_player = $AnimationPlayer

func _on_play_button_pressed():
	animation_player.play("play_game")
	animation_player.animation_finished.connect(func(_anim_name): SceneManager.transition_to_scene("res://scenes/game.tscn"))

func _on_quit_button_pressed():
	get_tree().quit()
