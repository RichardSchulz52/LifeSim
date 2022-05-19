extends ConditionLeaf

export (String) var var_name
export (int) var detect_radius

func tick(actor, blackboard):
	var entity = blackboard.get(var_name)
	if (entity == null):
		return FAILED
	var dist = actor.position.distance_to(entity.position)
	if (dist < detect_radius):
		return SUCCESS
	return FAILED
	
