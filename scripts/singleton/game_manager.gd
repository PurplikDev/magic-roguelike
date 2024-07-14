extends Node

var players: Array[Player]

var end_game_tween: Tween

func update_players():
	var min_one_alive: bool = true
	for player in players:
		if !player.is_alive:
			min_one_alive = false
	
	if !min_one_alive:
		end_game()

func end_game():
	if end_game_tween:
		end_game_tween.kill()
	end_game_tween = get_tree().create_tween()
	end_game_tween.tween_property(Engine, "time_scale", 0.25, 1.0)
	end_game_tween.tween_callback(func(): print("done!"))
