extends TextureButton

onready var panel = get_node("/root/Node2D/Tutorial") 
onready var control = get_node("/root/Node2D/Control") 
onready var buttons = get_node("/root/Node2D/Buttons")
onready var howto = get_node("/root/Node2D/Control/HowToPlay")
onready var light = get_node("/root/Node2D/Control/OmniLight")

func _pressed():
	panel.visible = !panel.visible
	howto.visible = false
	control.tutorial_on = true
	control.level = 0
	control.next_level() 
	buttons.visible = true
	light.visible = true
	
