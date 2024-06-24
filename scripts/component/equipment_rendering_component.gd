class_name EquipmentRenderingComponent
extends Node

@export var inventory_component: InventoryComponent

@export var casting_tool_sprite: AnimatedSprite2D
@export var hat_sprite: AnimatedSprite2D
@export var robe_sprite: AnimatedSprite2D
@export var accessory_sprite: AnimatedSprite2D

func _ready():
	inventory_component.content_change.connect(_on_content_changed)

func _on_content_changed(casting_tool: CastingTool, hat: Hat, robe: Robe, accessory: Accessory):
	
	if casting_tool != null:
		set_sprite(casting_tool_sprite, casting_tool)
	else: 
		casting_tool_sprite.sprite_frames = null
	
	if hat != null:
		set_sprite(hat_sprite, hat)
	else: 
		hat_sprite.sprite_frames = null
	
	if robe != null:
		set_sprite(robe_sprite, robe)
	else: 
		robe_sprite.sprite_frames = null
	
	if accessory != null:
		set_sprite(accessory_sprite, accessory)
	else: 
		accessory_sprite.sprite_frames = null

func set_sprite(animated_sprite: AnimatedSprite2D, equippable_item: EquippableItem):
	animated_sprite.sprite_frames = equippable_item.item_sprite
