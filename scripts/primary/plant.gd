extends Node2D

export (String) var group_name
onready var eatable = $Components/Eatable

func _ready():
	add_to_group(group_name)
