extends Node2D

const ArrowScene = preload("res://Weapons/Arrow.tscn")

onready var detectionZone = $TowerDetectionZone

export var fireRate = 1

var timeSinceLastFire = fireRate

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var enemies = detectionZone.enemies
	if (enemies.size() == 0):
		return
	var enemyToShootAt = _find_enemy_to_shoot_at(enemies)
	_try_shoot_at_enemy(enemyToShootAt, delta)

func _find_enemy_to_shoot_at(enemies):
	return enemies[0]

func _try_shoot_at_enemy(enemy, delta):
	timeSinceLastFire += delta
	if timeSinceLastFire >= fireRate:
		_shoot_at_enemy(enemy)
		timeSinceLastFire = 0

func _shoot_at_enemy(enemy):
	var arrow = ArrowScene.instance()
	arrow.global_position = global_position
	arrow._set_enemy(enemy)
	get_tree().current_scene.add_child(arrow)	
