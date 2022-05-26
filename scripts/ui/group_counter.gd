extends Label

export (String) var group_name

func _process(_delta):
	var group_entitys = get_tree().get_nodes_in_group(group_name)
	set_text(group_name + ": " + str(group_entitys.size()))
	
