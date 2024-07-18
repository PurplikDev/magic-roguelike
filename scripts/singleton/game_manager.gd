extends Node

var end_game_tween: Tween

func end_game():
	if end_game_tween:
		end_game_tween.kill()
	end_game_tween = get_tree().create_tween()
	end_game_tween.tween_property(Engine, "time_scale", 0.25, 1.0)
