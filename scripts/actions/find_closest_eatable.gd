extends ActionLeaf

export (String) var var_name

func tick(actor, blackboard):
	var group_entitys = []
	for eating in actor.eating.eatingGroups:
		var entitys = get_tree().get_nodes_in_group(eating)
		group_entitys = group_entitys + entitys
	group_entitys.erase(actor)
	if group_entitys.size() == 0:
		blackboard.set(var_name, null)
		return SUCCESS
	
	var closest = group_entitys[0]
	var closest_dist = actor.position.distance_to(group_entitys[0].position)
	
	for entity in group_entitys:
		var dist = actor.position.distance_to(entity.position)
		if dist < closest_dist:
			closest = entity
			closest_dist = dist
			
	blackboard.set(var_name, closest)
	return SUCCESS
