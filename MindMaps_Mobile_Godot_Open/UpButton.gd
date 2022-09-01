extends TextureButton

onready var control =  get_node("/root/Node2D/Control/")
var up = "ui_up"
var a = InputEventAction.new()


func _pressed():
	Input.a = true 
	#up.Input("ui_up") #update_tile() #Input.action_pressed.ui_up  = true
	print("up!")
	



	
