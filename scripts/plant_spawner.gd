extends TileMap

onready var plant = preload("res://scene/plant.tscn")

func _process(delta):
	var fertile_ground = get_used_cells_by_id(0)
	for t in fertile_ground:
		var r = randf()
		if r < 0.001 * delta:
			var i = plant.instance()
			i.add_to_group("plant")
			add_child(i)
			i.set_global_position(t * 32 + Vector2(16,16))
