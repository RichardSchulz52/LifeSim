extends ActionLeaf


export (String) var var_name

func tick(actor, blackboard):
	var entity = blackboard.get(var_name)
	if entity == null:
		return FAILURE
	var dist = entity.global_position.distance_to(actor.global_position)
	if dist < 35:
		actor.eating.eat(entity)
	return SUCCESS
