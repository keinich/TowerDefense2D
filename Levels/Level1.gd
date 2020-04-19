extends Node2D

const EnemyScene  = preload("res://Enemies/Enemy.tscn")

onready var nav_2d = $Navigation2D
onready var startPosition = $StartPostion
onready var targetPosition = $TargetPosition


# Called when the node enters the scene tree for the first time.
func _ready():
	var enemy = EnemyScene.instance()
	add_child(enemy)
	enemy.global_position = startPosition.global_position
	
	var path = nav_2d.get_simple_path(enemy.global_position, targetPosition.global_position)
	enemy.path = path


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
