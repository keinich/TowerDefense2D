extends Node2D

onready var progessBar = $ProgressBar

func set_value(value):
	progessBar.value = value
	
func set_max_value(value):
	progessBar.max_value = value	
