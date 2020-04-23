extends Node

export var icon : Texture
export var towerScenePath = ""
export var towerScene : Resource

onready var towerBaseStats = $TowerBaseStats

func get_stats():
	return towerBaseStats
