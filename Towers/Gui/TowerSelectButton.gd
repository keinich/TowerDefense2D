extends TextureButton

var towerDefinition

func set_tower_definition(towerDefinitionToSet):
	towerDefinition = towerDefinitionToSet

signal select_tower(towerScene)

func _on_TowerSelectButton_pressed():	
	emit_signal("select_tower", towerDefinition)
