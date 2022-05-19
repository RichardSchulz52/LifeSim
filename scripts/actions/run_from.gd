extends ActionLeaf

export (String) var var_name

func tick(actor, blackboard):
	var entity = blackboard.get(var_name)
	if entity == null:
		return FAILURE
	var away_vector = actor.position - entity.position
	var velocity = away_vector.normalized()
	actor.walk(velocity)
	return SUCCESS
