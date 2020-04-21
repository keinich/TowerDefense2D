extends Node

onready var health = 100 setget set_health

signal health_changed

func set_health(value):
	health = value
	emit_signal("health_changed")
	
