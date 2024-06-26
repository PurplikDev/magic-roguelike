extends CanvasLayer

@onready var health_bar: StatBar = $HealthBar
@onready var ignis_bar: StatBar = $IgnisBar
@onready var aer_bar: StatBar = $AerBar
@onready var terra_bar: StatBar = $TerraBar
@onready var aqua_bar: StatBar = $AquaBar

@onready var spell_wheel: SpellWheel = $SpellWheel

@export var health_stat: StatComponent
@export var ignis_stat: StatComponent
@export var aer_stat: StatComponent
@export var terra_stat: StatComponent
@export var aqua_stat: StatComponent

@export var spell_component: SpellCastingComponent

func _ready():
	spell_wheel.spell_component = spell_component
	
	
	health_bar.set_max_value(health_stat.max_value)
	ignis_bar.set_max_value(ignis_stat.max_value)
	aer_bar.set_max_value(aer_stat.max_value)
	terra_bar.set_max_value(terra_stat.max_value)
	aqua_bar.set_max_value(aqua_stat.max_value)
	
	health_bar.set_value(health_stat.value)
	ignis_bar.set_value(ignis_stat.value)
	aer_bar.set_value(aer_stat.value)
	terra_bar.set_value(terra_stat.value)
	aqua_bar.set_value(aqua_stat.value)
	
	health_stat.max_value_update.connect(func(value):
		health_bar.set_max_value(value))
	ignis_stat.max_value_update.connect(func(value):
		ignis_bar.set_max_value(value))
	aer_stat.max_value_update.connect(func(value):
		aer_bar.set_max_value(value))
	terra_stat.max_value_update.connect(func(value):
		terra_bar.set_max_value(value))
	aqua_stat.max_value_update.connect(func(value):
		aqua_bar.set_max_value(value))
	
	health_stat.value_update.connect(func(value):
		health_bar.set_value(value))
	ignis_stat.value_update.connect(func(value):
		ignis_bar.set_value(value))
	aer_stat.value_update.connect(func(value):
		aer_bar.set_value(value))
	terra_stat.value_update.connect(func(value):
		terra_bar.set_value(value))
	aqua_stat.value_update.connect(func(value):
		aqua_bar.set_value(value))
