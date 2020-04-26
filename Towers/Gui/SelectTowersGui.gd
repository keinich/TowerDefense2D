extends VBoxContainer

#Scene Definitions
const TowerButtonScene = preload("res://Towers/Gui/TowerSelectButton.tscn")
const TestTowerScene = preload("res://Towers/ArcherTower.tscn")
const PlaceTowerButton = preload("res://Towers/Gui/TowerSelectButton.tscn")

#Graph Members
onready var detailGui = $DetailGui

#Export Vars
export(Array, Resource) var towerDefinitions

#Vars
var testActive = false

#Callbacks
func _ready():
	for i in range(0, towerDefinitions.size()):
		var towerDefinition = towerDefinitions[i].instance()
		add_child(towerDefinition)
		var button = PlaceTowerButton.instance()
		button.set_tower_definition(towerDefinition)
		add_child(button)
		button.connect("select_tower", self, "on_tower_selected")

func _input(event):
	if testActive:
		return
	if event is InputEventKey:
		if event.scancode == KEY_G:
			add_tower_to_select(TestTowerScene)
			testActive = true

#Custom Functions	
func add_tower_to_select(towerScene : Resource):
	var towerButton = TowerButtonScene.instance()
	towerButton.TowerScene = towerScene
	add_child(towerButton)
	towerButton.connect("select_tower", self, "on_tower_selected")
	
func on_tower_selected(towerDefinition):
	detailGui.set_tower_definition(towerDefinition)
	var tower = towerDefinition.towerScene.instance()
	tower.set_preview_mode(true)
	add_child(tower)
	tower.towerStats.attackDamage = towerDefinition.towerBaseStats.attackDamage
	tower.towerStats.attackSpeed = towerDefinition.towerBaseStats.attackSpeed
	

