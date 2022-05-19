extends Node

class_name Eating

export (int) var maxKcal
export (int) var currentKcal
export (int) var kcalDrain

func eat(entity):
	assert("eatable" in entity)
	entity.queue_free()
	currentKcal += entity.eatable.getKcal()
	if currentKcal > maxKcal:
		currentKcal = maxKcal    

# Must be called in physics loop
func digest(entity, delta):
	currentKcal -= delta * kcalDrain
	if currentKcal < 0:
		entity.queue_free()
