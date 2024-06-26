class_name SpellCastingComponent
extends Node

@export var actor: Entity
@export var cast_timer: Timer

@export var ignis_stat: StatComponent
@export var aer_stat: StatComponent
@export var terra_stat: StatComponent
@export var aqua_stat: StatComponent

var spells: Array[Spell]
var current_spell: Spell
var max_spell_amount: int

func _ready():
	cast_timer.timeout.connect(cast)

func start_cast():
	if current_spell != null:
		cast_timer.start()
	else:
		print_rich("[b][color=red]No spell selected![/color][/b]")

func stop_cast():
	if current_spell != null:
		cast_timer.stop()

func set_current_spell(index: int):
	current_spell = spells[index]
	cast_timer.wait_time = current_spell.cast_cooldown

func cast():
	ignis_stat.decrease(current_spell.ignis_cost)
	aer_stat.decrease(current_spell.aer_cost)
	terra_stat.decrease(current_spell.terra_cost)
	aqua_stat.decrease(current_spell.aqua_cost)
