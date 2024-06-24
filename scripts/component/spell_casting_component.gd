class_name SpellCastingComponent
extends Node

@export var actor: Entity

var spells: Array[Spell]
var current_spell: int = 0
var max_spell_amount: int

func start_cast():
	print(actor.name, ": guh")

func stop_cast():
	print(actor.name, ": hug")

