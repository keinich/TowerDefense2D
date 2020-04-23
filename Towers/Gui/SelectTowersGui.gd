extends VBoxContainer

const TowerButtonScene = preload("res://Towers/Gui/TowerSelectButton.tscn")

const TestTowerScene = preload("res://Towers/ArcherTower.tscn")
var testActive = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func add_tower_to_select(towerScene : Resource):
	var towerButton = TowerButtonScene.instance()
	towerButton.TowerScene = towerScene
	add_child(towerButton)
	towerButton.connect("select_tower", self, "on_tower_selected")
	
func on_tower_selected(towerScene : Resource):
	pass
	
func _input(event):
	if testActive:
		return
	if event is InputEventKey:
		if event.scancode == KEY_G:
			add_tower_to_select(TestTowerScene)
			testActive = true
