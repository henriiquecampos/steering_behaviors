extends KinematicBody2D

const MAX_SPEED = 300
const MAX_FORCE = 0.02
var velocity = Vector2()
onready var target = get_pos()

export (int, "SEEK", "FLEE") var mode = 0
func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	velocity = steer(target)
	move(velocity * delta)
	target = get_viewport().get_mouse_pos()
func steer(target):
	var desired_velocity = Vector2(target - get_pos()).normalized() \
	* MAX_SPEED
	if mode == 0:
		pass
	elif mode == 1:
		desired_velocity = -desired_velocity
	var steer = desired_velocity - velocity
	var target_velocity = velocity + (steer * MAX_FORCE)
	return(target_velocity)
