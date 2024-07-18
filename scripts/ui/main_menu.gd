extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var play_button = $CanvasLayer/Control/PlayButton
@onready var quit_button = $CanvasLayer/Control/QuitButton

func _ready():
	animation_player.animation_finished.connect(
		func(p_name: String):
			if p_name == "intro_animation":
				play_button.disabled = false
				quit_button.disabled = false
			)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		animation_player.play("RESET")
		play_button.disabled = false
		quit_button.disabled = false

func _on_play_button_pressed():
	if animation_player.is_playing():
		SceneManager.transition_to_scene("res://scenes/game.tscn")
	animation_player.play("play_game")
	animation_player.animation_finished.connect(func(_anim_name): SceneManager.transition_to_scene("res://scenes/game.tscn"))

func _on_quit_button_pressed():
	get_tree().quit()
