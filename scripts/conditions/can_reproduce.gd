extends ConditionLeaf

func tick(actor, blackboard):
	if actor.reproduction.canReproduce():
		return SUCCESS
	return FAILED
