extends KinematicBody2D

export var speed = 10

var enemy = null

func _set_enemy(enemyToSet):
	enemy = enemyToSet

func _process(delta):
	if (not is_instance_valid(enemy)):
		queue_free()
		return
	var distanceVector = enemy.global_position - position
	var upVector = Vector2(0,-1)
	var angle = upVector.angle_to(distanceVector.normalized())
	rotation = angle
	position = position.linear_interpolate(enemy.global_position, delta * speed)

func _on_ProjectileHitbox_area_entered(area):
	queue_free()
