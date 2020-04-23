extends TextureButton

var towerDefinition

signal select_tower(towerScene)

func _on_TowerSelectButton_pressed():	
	emit_signal("select_tower", towerDefinition)
