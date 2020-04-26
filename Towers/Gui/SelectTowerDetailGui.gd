extends NinePatchRect

#Scene Definitions

#Graph Members
onready var attackAttributeBox = $TowerAttributesContainer/AttackAttributeBox

#Export Vars

#Vars

func set_tower_definition(towerDefinition):
	attackAttributeBox.set_value(
		towerDefinition.towerBaseStats.attackDamage - 10
	)
