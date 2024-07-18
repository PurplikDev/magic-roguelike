class_name SpellCastingComponent
extends Node

@export var actor: Entity

@export var cast_timer: Timer
@export var cast_marker: Node2D

@export_group("Stats")
@export var is_free: bool = false
@export var ignis_stat: StatComponent
@export var aer_stat: StatComponent
@export var terra_stat: StatComponent
@export var aqua_stat: StatComponent

@export_group("Spells")
@export var spells: Array[Spell]
@export var current_spell: Spell

var max_spell_amount: int
var current_spell_instance: Node

var casting: bool = false



func _process(_delta):
	if casting && cast_timer.is_stopped():
		cast_timer.start()
		cast()

func start_cast():
	if current_spell != null:
		casting = true
	else:
		print_rich("[b][color=aqua]No spell selected![/color][/b]")

func stop_cast():
	if current_spell != null:
		casting = false

func set_current_spell(index: int):
	current_spell = spells[index]
	cast_timer.wait_time = current_spell.cast_cooldown

func cast():
	if is_free || can_afford_cast(current_spell):
		drain_vis(current_spell)
		var spell_instance: Node2D = current_spell.spell_scene.instantiate()
		actor.get_parent().add_child(spell_instance)
		spell_instance.global_position = cast_marker.global_position
		spell_instance.global_rotation = cast_marker.global_rotation

func can_afford_cast(p_spell: Spell) -> bool:
	if p_spell.ignis_cost <= ignis_stat.value && p_spell.aer_cost <= aer_stat.value && p_spell.terra_cost <= terra_stat.value && p_spell.aqua_cost <= aqua_stat.value:
		return true
	print_rich("[b][color=red]Add visual queue for cost![/color][/b]")
	return false

func drain_vis(p_spell: Spell):
	ignis_stat.decrease(p_spell.ignis_cost)
	aer_stat.decrease(p_spell.aer_cost)
	terra_stat.decrease(p_spell.terra_cost)
	aqua_stat.decrease(p_spell.aqua_cost)
