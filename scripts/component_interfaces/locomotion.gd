extends Node

class_name Locomotion

export (int) var speed

func move(moveable : KinematicBody2D, steering : Steering):
	var dir = steering.getDirection().normalized()
	moveable.move_and_slide(dir * speed)
