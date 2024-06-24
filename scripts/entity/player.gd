# Player class
extends Entity



func _on_health_component_died():
	print("bye")
	get_tree().quit()

func _on_health_component_health_update(health):
	print("ouch | ", health)


func _on_hitbox_hit(_damage_source):
	var inventory_component: InventoryComponent = $Components/InventoryComponent
	inventory_component.hat = ItemDB.items[0]
