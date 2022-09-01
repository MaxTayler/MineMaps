extends ColorRect

onready var control = get_node("/root/Node2D/Control")
var i = 0

func _ready(): #change colors To game pallette
	$VBoxContainer/Wall/HowToPlay.set_frame_color(control.color_index[i])
	i += 1
	$VBoxContainer/Safe/HowToPlay2.set_frame_color(control.color_index[i])
	i += 1
	$VBoxContainer/Near/NearRect.set_frame_color(control.color_index[i])
	i += 1
	$VBoxContainer/Next/NextRect.set_frame_color(control.color_index[i])
	i += 1
	$VBoxContainer/Reset/ResetRect.set_frame_color(control.color_index[i])
	i += 1
	$VBoxContainer/Start/StartRect.set_frame_color(control.color_index[i])
	i += 1
	$VBoxContainer/Level/LevelRect.set_frame_color(control.color_index[i])
