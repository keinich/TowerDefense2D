extends NinePatchRect

#Graph Members
onready var valueLabel = $ValueLabel

func set_value(value):
	valueLabel.text = str(value)
