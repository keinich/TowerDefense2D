extends Node2D

onready var progessBar = $ProgressBar

func set_value(value):
	progessBar.value = value
