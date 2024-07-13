extends Node

var items: Array[Item] = [ 
	preload("res://resources/items/equippable/hat/goggles_of_thaumaturgy.tres")
	]


func get_item(item_name: String) -> Item:
	for item in items:
		if item.item_name == item_name:
			return item
	return null
