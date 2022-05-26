extends Reproduction

class_name Mating

export (int) var mating_cooldown_seconds = 20
export (String) var offspring_res  # todo fix this to resource
var last_mating_os_ms = 0


func _ready():
	last_mating_os_ms = OS.get_ticks_msec()

func canReproduce() -> bool:
	var t = OS.get_ticks_msec()
	var last_mate = (t - last_mating_os_ms) / 1000
	return last_mate > mating_cooldown_seconds
	
func reproduce(entity) -> bool:
	if not entity.reproduction.canReproduce():
		return false
	entity.reproduction.last_mating_os_ms = OS.get_ticks_msec()
	last_mating_os_ms = OS.get_ticks_msec()

	var offspring = load(offspring_res) # todo fix this
	var offspringInst = offspring.instance() as Node2D
	offspringInst.position = Vector2(32,32) # todo change that
	get_tree().get_root().add_child(offspringInst)
	print("mating")
	return true
