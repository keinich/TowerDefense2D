extends KinematicBody2D

enum {
	STANDING,
	WALKING
}

var speed = 50.0
var path = PoolVector2Array() setget set_path
var state = STANDING

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)

func _process(delta):
	var move_distance = speed * delta
	move_along_path(move_distance)
	
func move_along_path(distance : float) -> void:
	animationState.travel("Walk")
	var start_point = position
	for i in range(path.size()):
		var distance_to_next = start_point.distance_to(path[0])
		var difference = (path[0] - start_point).normalized()
		animationTree.set("parameters/Idle/blend_position", difference)
		animationTree.set("parameters/Walk/blend_position", difference)
		if distance <= distance_to_next and distance >= 0.0:
			position = start_point.linear_interpolate(path[0], distance / distance_to_next)
			state = WALKING
			break
		elif distance < 0.0:
			position = path[0]
			set_process(false)
			state = STANDING
		
		distance -= distance_to_next
		start_point = path[0]
		path.remove(0)
	
func set_path(value : PoolVector2Array) -> void:
	path = value
	if value.size() == 0:
		return
	set_process(true)