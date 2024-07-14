extends Node

func transition_to_scene(path: String):
	print_rich("[rainbow] SCENE TRANSITION HERE [/rainbow]")
	change_scene(path)

func change_scene(path: String):
	get_tree().change_scene_to_file(path)
