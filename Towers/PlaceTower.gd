extends Node2D

var tower = null

func _ready():
	tower.set_process(false)

func _input(event):
	if event is InputEventMouseMotion:
		position = event.position
	elif event is InputEventMouseButton:
		place_tower()
		
func set_tower_definition(towerDefinition):	
	tower = towerDefinition.towerScene.instance()
	tower.set_preview_mode()	
	add_child(tower)
	
func place_tower():
	get_parent().add_child(tower)
	queue_free()
