extends KinematicBody2D

export var speed = 10

var enemy = null

func _set_enemy(enemyToSet):
	enemy = enemyToSet

func _process(delta):
	if (enemy == null):
		return
	var distanveVector = enemy.global_position - position
	var upVector = Vector2(0,1)
	var angle = distanveVector.dot(upVector)
	rotation = angle
	position = position.linear_interpolate(enemy.global_position, delta * speed)

func _on_ProjectileHitbox_area_entered(area):
	queue_free()
