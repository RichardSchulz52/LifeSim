extends ActionLeaf


export (String) var var_name

func tick(actor, blackboard):
	var entity = blackboard.get(var_name)
	if entity == null:
		return FAILURE
	var towards_vector = entity.position - actor.position
	var velocity = towards_vector.normalized()
	actor.steering.direction = velocity
	return SUCCESS

