extends ActionLeaf

export (float) var deviance

func tick(actor, blackboard):
	var dir = blackboard.get("direction")
	if dir == null:
		dir = Vector2(1,0)
	
	randomize()
	dir = Vector2(dir.x + rand_range(-deviance,deviance), dir.y + rand_range(-deviance,deviance)).normalized()
	blackboard.set("direction", dir)
	actor.steering.direction = dir
	return SUCCESS
