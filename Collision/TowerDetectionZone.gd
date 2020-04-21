extends Area2D

var enemies = []

func _on_TowerDetectionZone_body_entered(body):
	enemies.append(body)
	#body.connect("on_dead", self, "_on_TowerDetectionZone_body_exited")

func _on_TowerDetectionZone_body_exited(body):
	enemies.erase(body)
	
