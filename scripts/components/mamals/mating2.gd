extends Reproduction

export (int) var a 
export (int) var mating_cooldown_seconds = 20
export (String) var offspring_res  # todo fix this to resource
var last_mating_os_ms = 0


func _ready():
	pass

func canReproduce() -> bool:
	var t = OS.get_ticks_msec()
	var last_mate = (t - last_mating_os_ms) / 1000
	return last_mate > mating_cooldown_seconds
	
func reproduce(entity) -> bool:
	if not entity.reproduction.canReproduce():
		return false
	entity.reproduction.last_mating_os_ms = OS.get_ticks_msec()
	last_mating_os_ms = OS.get_ticks_msec()

	offspring = load(offspring_res) # todo fix this
	var offspringInst = offspring.instance() as Node2D
	offspringInst.global_position = Vector2(32,32) # todo change that
	get_tree().get_root().add_child(offspringInst)
	return true
