extends Node

export var health = 1000 setget set_health

signal health_changed

func set_health(value):
	health = value
	emit_signal("health_changed")
	
