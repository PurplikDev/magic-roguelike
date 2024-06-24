class_name SpellCastingComponent
extends Node

@export var actor: Entity

func start_cast():
	print(actor.name, ": guh")

func stop_cast():
	print(actor.name, ": hug")
