extends TextureButton

onready var panel = get_node("/root/Node2D/Control/HowToPlay") 
onready var light = get_node("/root/Node2D/Control/OmniLight") 
onready var buttons = get_node("/root/Node2D/Buttons")
onready var on = 1

func _pressed():
	panel.visible = !panel.visible
	light.visible = !light.visible
	buttons.visible = !buttons.visible
	
