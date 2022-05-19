extends KinematicBody2D

export (int) var detect_radius

var target
var lookdir = 1
var lookdirs = [-1, 1]

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Sprite.self_modulate = Color(0.2,0,0)
#	var shape = CircleShape2D.new()
#	shape.radius = detect_radius
#	$Visibility/CollisionShape2D.shape = shape

func _physics_process(_delta):
	if !target:
		$Sight.rotation += _delta * PI * lookdir
		if $Sight.rotation >= 6.283185:
			$Sight.rotation - 6.283185
		elif $Sight.rotation <= 6.283185:
			$Sight.rotation + 6.283185
	if $Sight.is_colliding():
		target = $Sight.get_collider()
		$Sprite.self_modulate = Color(1,0,0)
		var targetDir = $Sight.get_collision_normal() * -1
		move_and_slide(targetDir * 300)
	else:
		if target:
			lookdir = lookdirs[randi() % lookdirs.size()]
		target = null
		$Sprite.self_modulate = Color(0.2,0,0)
