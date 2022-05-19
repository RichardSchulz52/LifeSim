extends ActionLeaf

export (String) var var_name

func tick(actor, blackboard):
	var entity = blackboard.get(var_name)
	var away_vector = (actor.position - entity.position) * -1
	var velocity = away_vector.normalized()
	actor.move_and_slide(velocity * 200)
	return SUCCESS
