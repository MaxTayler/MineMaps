extends Node


# Declare member variables here. Examples:
var color1 = Color( 0.94, 0.97, 1, 1 ) #alice blue
var color2 = Color( 0.5, 1, 0.83, 1 ) #aquamaine
var color3 = Color( 0.54, 0.17, 0.89, 1 ) #-- Blue violet color.
var color4 = Color( 0.82, 0.41, 0.12, 1 ) #-- Chocolate 

var color5 = Color(1,1,0,1)

var set = 0


#var light = load("res://DirectionalLight.gd").new()

# Called when the node enters the scene tree for the first time.
func _process(Delta):
	if Input.is_action_just_pressed("ui_up") == true:
		#print("Right")	
		$Light.update_color(color1) #calls script DirectionalLight
		#set += 1
		#$Control.get_array()
		
	if Input.is_action_just_pressed("ui_down") == true:
		#print("Left pressed")
		$Light.update_color(color2)
		$OmniLight.update_color(color5)
		
	if Input.is_action_just_pressed("ui_right") == true:
		#print("Right pressed")
			
		$UI_Title.get_array() # array test output ref array_test
		$Light.update_color(color3)
		#$UI_Title/VBoxContainer/Label.
		
	if Input.is_action_just_pressed("ui_left") == true:
		#print("Left pressed")
		$Light.update_color(color4)	
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
