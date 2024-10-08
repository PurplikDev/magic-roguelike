class_name Player
extends Entity

@export var spell_wheel: SpellWheel
@export var camera: AnchoredCamera
@export var caster: Marker2D

@export_group("Components")
@export var move_component: MoveComponent
@export var animation_component: AnimationManagerComponent
@export var spell_casting_component: SpellCastingComponent
@export var interaction_component: InteractionComponent

@onready var death_screen = $UserInterface/DeathScreen

var is_alive: bool = true

func _physics_process(_delta):
	
	if !is_alive:
		return
	
	if move_component != null:
		move_component.direction = Input.get_vector("left", "right", "up", "down")
	
	if animation_component != null:
		animation_component.direction = Input.get_vector("left", "right", "up", "down")
	
	if interaction_component != null && Input.is_action_just_pressed("interact"):
		interaction_component.interact()
	
	if spell_casting_component != null:
		if Input.is_action_just_pressed("cast"):
			spell_casting_component.start_cast()
		if Input.is_action_just_released("cast"):
			spell_casting_component.stop_cast()
		
	if spell_wheel != null:
		if Input.is_action_just_pressed("spell_wheel"):
			spell_wheel.wheel_show()
		if Input.is_action_just_released("spell_wheel"):
			spell_wheel.wheel_hide()
	
	if camera != null:
		if Input.is_action_just_pressed("camera_zoom_in"):
			camera.zoom_in()
		if Input.is_action_just_pressed("camera_zoom_out"):
			camera.zoom_out()
	
	if caster != null:
		caster.look_at(get_global_mouse_position()) 



func _on_hitbox_hit(_damage_source):
	var inventory_component: InventoryComponent = $Components/InventoryComponent
	inventory_component.hat = ItemDB.get_item("goggles_of_thaumaturgy")


func _on_health_stat_value_empty():
	is_alive = false
	move_component.direction = Vector2.ZERO
	# GameManager.end_game()
	death_screen.display()
