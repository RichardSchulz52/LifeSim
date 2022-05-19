extends KinematicBody2D

class_name Animal

onready var steering = $Components/Steering
onready var locomotion = $Components/Locomotion
onready var eatable = $Components/Eatable
onready var eating = $Components/Eating

func _physics_process(delta):
	locomotion.move(self, steering)

	eating.digest(self, delta)
	var s = eating.currentKcal / eating.maxKcal
	$Sprite.self_modulate = Color(s,s,s) # todo replace with good debugging view
	
	

