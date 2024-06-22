class_name InputComponent
extends Node

@export var move_component: MoveComponent

func _physics_process(_delta):
	move_component.direction = Input.get_vector("left", "right", "up", "down")
