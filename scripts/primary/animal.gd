extends KinematicBody2D

class_name Animal

export (String) var group_name
onready var steering = $Components/Steering
onready var locomotion = $Components/Locomotion
onready var eatable = $Components/Eatable
onready var eating = $Components/Eating
onready var reproduction = $Components/Reproduction

func _ready():
	add_to_group(group_name)

func _physics_process(delta):
	locomotion.move(self, steering)

	eating.digest(self, delta)
	var s = eating.currentKcal / eating.maxKcal
	$Sprite.self_modulate = Color(s,s,s) # todo replace with good debugging view
	
	

