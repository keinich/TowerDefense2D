extends Node2D

const EnemyScene  = preload("res://Enemies/Enemy.tscn")
const TowerScene = preload("res://Towers/ArcherTower.tscn")
const PlaceTowerScene = preload("res://Towers/PlaceTower.tscn")
const ArcherTowerDefinition = preload("res://Towers/ArcherTowerDefinition.tscn")

onready var nav_2d = $Navigation2D
onready var startPosition = $StartPostion
onready var targetPosition = $TargetPosition

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#Test Enemy
	var enemy = EnemyScene.instance()
	add_child(enemy)
	enemy.global_position = startPosition.global_position
	
	#Test Path
	var path = nav_2d.get_simple_path(enemy.global_position, targetPosition.global_position)
	enemy.path = path
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var testActive = false
func _input(event):
	if testActive:
		return
	if event is InputEventKey:
		testActive = true
		var towerDefinition = ArcherTowerDefinition.instance()
		var tower = towerDefinition.towerScene.instance()
		tower.set_preview_mode(true)
		add_child(tower)
