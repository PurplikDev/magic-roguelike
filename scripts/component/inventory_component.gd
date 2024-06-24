class_name InventoryComponent
extends Node

signal content_change(casting_tool: CastingTool, hat: Hat, robe: Robe, accessory: Accessory)

var casting_tool: CastingTool = null:
	set(value):
		casting_tool = value
		content_change.emit(casting_tool, hat, robe, accessory)

var hat: Hat = null:
	set(value):
		hat = value
		content_change.emit(casting_tool, hat, robe, accessory)

var robe: Robe = null:
	set(value):
		robe = value
		content_change.emit(casting_tool, hat, robe, accessory)

var accessory: Accessory = null:
	set(value):
		accessory = value
		content_change.emit(casting_tool, hat, robe, accessory)
