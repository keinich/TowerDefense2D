extends Area2D

var enemies = []

func _on_TowerDetectionZone_body_entered(body):
	enemies.append(body)

func _on_TowerDetectionZone_body_exited(body):
	enemies.erase(body)
	
