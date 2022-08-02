extends Node
# Declare member variables here. Examples:
var color0 = Color( 0.9, 0.9, 1, 1) 
var color1 = Color( 0.2, 0.7, 0.8, 1) 
var color2 = Color( 0.4, 0, 0.5, 1 ) #aquamaine
var color3 = Color( 0.89, 0.0, 0.89, 1 ) #-- Blue violet color.
var color4 = Color( 1, 0, 0, 1 ) # ( 0.82, 0.41, 0.12, 0.5 ) #-- Chocolate 
var color5 = Color( 0.0, 0.93, 0.2, 1)
var color6 = Color( 0.5,0.6,0, 1 )
var color7 = Color( 1, 0.6, 0, 1 )

var color_index = [color0,color1,color2,color3,color4,color5,color6,color7]
var color_load = Color(1,1,0,1)

enum States {WALL,SAFE,NEAR,NEXT_TO,DEATH,START,GOAL,COIN}

var level = 1
var level_name = "Level 0"
var new_text = "error"

var tile_text = ["You Hit a Wall","You are Safe","Danger is Close","You are Next to Danger","You Have Died","LEVEL 0","You Found some Points","WANt Happened"]
var set = 0

#location on map 
var map_x = 0
var map_y = 0 

var map_start_x = 3
var map_start_y = 3

var map_size_x = 0
var map_size_y = 0 

var last_direction = 1 # used to move out of wall 
onready var level_list = [$Maps/Map1,$Maps/Map1,$Maps/Map2,$Maps/Map3,$Maps/Map4,$Maps/Map5]
onready var load_level = level_list[3]
# Called when the node enters the scene tree for the first time.
func _ready():
	
	map_size_x = len(load_level.row_1)-1
	print("Map X")
	print(map_size_x)
	map_size_y = len(load_level.map_2d)-1
	print("Map Y")
	print(map_size_y)
	print(load_level)
	pass
	
# key and button input 
func _process(delta):
	if Input.is_action_just_pressed("ui_up") == true:
		if map_y > 0: # set bount array 
			map_y -= 1
		var map_value = load_level.map_2d[map_y][map_x]
		print(map_value)
		new_text = tile_text[map_value]
		color_load = color_index[map_value] #set color
		blink()
		#update_tile()
		#$Light.update_color(color_load)
		#$OmniLight.update_color(color_load)
		
	if Input.is_action_just_pressed("ui_down") == true:
		if map_y < map_size_y: # set bount array
			map_y += 1
		var map_value = load_level.map_2d[map_y][map_x]
		print(map_value)
		color_load = color_index[map_value] #set color
		new_text = tile_text[map_value]
		blink()
		#update_tile()
		#$Light.update_color(color_load)
		#$OmniLight.update_color(color_load)
		
		
	if Input.is_action_just_pressed("ui_right") == true:
		if map_x < map_size_x: # set bount array
			map_x += 1
		var map_value = load_level.map_2d[map_y][map_x]
		print(map_value)
		color_load = color_index[map_value] #set color
		new_text = tile_text[map_value]
		blink()
		#update_tile()
		#Light.update_color(color_load)
		#OmniLight.update_color(color_load)
		
		
	if Input.is_action_just_pressed("ui_left") == true:
		if map_x > 0: # set bount array 
			map_x -= 1
		var map_value = load_level.map_2d[map_y][map_x]
		print(map_value)
		color_load = color_index[map_value] #set color
		new_text = tile_text[map_value]
		blink()
		#update_tile()
		#$Light.update_color(color_load)
		#$OmniLight.update_color(color_load)
		
	#if Input.is_action_just_pressed("show_map") == true:
		#var format_string = "{map}"
		# Using the 'format' method, replace the 'str' placeholder
		#var actual_string = format_string.format({"map": $UI_Title.map_2d})
		#$UI_Title/VBoxContainer/Label2.update_text(actual_string)
		
func update_tile():
	$Light.update_color(color_load)
	$OmniLight.update_color(color_load)
	$LCD/Viewport/LCDscreen.update_text(new_text)
	$UI_Title/VBoxContainer/XandY.update_debug(map_x,map_y)
	var map_value = load_level.map_2d[map_y][map_x]
	if map_value == 4:
		death()
	if map_value == 6:
		level += 1
		next_level()
		
	
	
func treasure():
	
	pass

func wall():
	pass

func next_level():
	$OmniLight.update_color(Color(0,0,0,0))
	yield(get_tree().create_timer(0.4), "timeout")
	$OmniLight.update_color(color6)
	yield(get_tree().create_timer(0.4), "timeout")
	$OmniLight.update_color(color6)
	yield(get_tree().create_timer(0.4), "timeout")
	$OmniLight.update_color(Color(0,0,0,0))
	yield(get_tree().create_timer(0.4), "timeout")
	$OmniLight.update_color(color6)
	yield(get_tree().create_timer(0.4),"timeout")
	$OmniLight.update_color(Color(0,0,0,0))
	yield(get_tree().create_timer(0.4), "timeout")
	load_level = level_list[level]# load new next 
	map_start_x = load_level.start_x
	map_start_y = load_level.start_y
	var map_value = load_level.map_2d[map_start_x][map_start_y]
	print(map_value)
	color_load = color_index[map_value] #set color
	new_text = tile_text[map_value]
	print(load_level)
	update_tile()
	
func death():
	$OmniLight.update_color(Color(0,0,0,0))
	yield(get_tree().create_timer(0.4), "timeout")
	$OmniLight.update_color(Color(1,0,0,1))
	yield(get_tree().create_timer(0.4), "timeout")
	$OmniLight.update_color(Color(0,0,0,0))
	yield(get_tree().create_timer(0.4), "timeout")
	$OmniLight.update_color(Color(1,0,0,1))
	yield(get_tree().create_timer(0.4), "timeout")
	map_x = map_start_x
	map_y = map_start_y
	var map_value = load_level.map_2d[map_start_x][map_start_y]
	print(map_value)
	color_load = color_index[map_value] #set color
	new_text = tile_text[map_value]
	update_tile()
	#Restart Level
	
func blink():
	$OmniLight.update_color(Color(0,0,0,0))
	yield(get_tree().create_timer(0.7), "timeout")
	update_tile()	
# reset game 

