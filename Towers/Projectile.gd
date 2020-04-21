extends KinematicBody2D

export var speed = 10
export var damage = 50

var enemy = null

func _set_enemy(enemyToSet):
	enemy = enemyToSet

func _process(delta):
	if (enemy == null):
		return
	position = position.linear_interpolate(enemy.global_position, delta * speed)


func _on_ProjectileHitbox_area_entered(area):
	queue_free()
