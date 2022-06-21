extends ConditionLeaf

export (int) var threshold

func tick(actor, blackboard):
	if actor.eating.kcalPercentage() < threshold:
		return SUCCESS
	return FAILURE
