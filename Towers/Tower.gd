extends Node2D

const ArrowScene = preload("res://Weapons/Arrow.tscn")

onready var detectionZone = $TowerDetectionZone
onready var icon = $Sprite
onready var towerStats = $TowerStats setget set_tower_stats

var timeSinceLastFire = 0
var preview_mode = false
var fireRate = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_icon():
	return icon.texture

func _input(event):
	if preview_mode:
		if event is InputEventMouseMotion:
			position = event.position
		elif event is InputEventMouseButton:
			preview_mode = false
		
func _process(delta):
	if preview_mode:
		pass
	else:
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

func get_texture():
	return icon.texture

func set_preview_mode(value):
	preview_mode = value
	
func set_tower_stats(value):
	towerStats = value
	fireRate = 1.0 / (towerStats.attackSpeed / 60.0)
