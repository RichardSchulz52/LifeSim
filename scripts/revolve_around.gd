extends Area2D


export (int) var square_size


func _ready():
	pass # Replace with function body.

func _process(_delta):
	var animals = get_tree().get_nodes_in_group("animal")
	for animal in animals:
		var rel_animal_pos = animal.position - self.position
		if rel_animal_pos.x > square_size:
			animal.position -= Vector2(square_size, 0)
		if rel_animal_pos.y > square_size: 
			animal.position -= Vector2(0, square_size)
		if rel_animal_pos.x < 0:
			animal.position += Vector2(square_size, 0)
		if rel_animal_pos.y < 0:
			animal.position += Vector2(0, square_size)

func _draw():
	draw_line(Vector2.ZERO, Vector2(square_size, 0), Color(255, 0, 0), 1)
	draw_line(Vector2.ZERO, Vector2(0, square_size), Color(255, 0, 0), 1)
	draw_line(Vector2(0, square_size), Vector2(square_size, square_size), Color(255, 0, 0), 1)
	draw_line(Vector2(square_size, 0), Vector2(square_size, square_size), Color(255, 0, 0), 1)
	

