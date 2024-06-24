# Player class
extends Entity

func _on_hitbox_hit(_damage_source):
	var inventory_component: InventoryComponent = $Components/InventoryComponent
	inventory_component.hat = ItemDB.items[0]
