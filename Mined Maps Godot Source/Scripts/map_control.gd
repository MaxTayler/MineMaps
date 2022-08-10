extends Node
# Declare member variables here. Examples:
var color0 = Color( 0.9, 0.7, 0.8, 0.2) # Wall Edge Edge of map 
var color1 = Color( 0, 0.7, 0.9, 1) # Safe Tile
var color2 = Color( 0.5, 0, 0.6, 1 ) # Near Danger
var color3 = Color( 0.80, 0.0, 0.80, 1 ) #-- Blue violet color.
var color4 = Color( 1, 0, 0, 1 ) # Death Tile Reset to start Tile
var color5 = Color( 0.0, 0.93, 0.2, 1) # Start Tile 
var color6 = Color( 0.5,0.6,0, 1 ) # Next Level

var color7 = Color( 1, 0.6, 0, 1 ) # add Point

var color_index = [color0,color1,color2,color3,color4,color5,color6,color7]
var color_load = Color(0,0,0,0)
enum States {WALL,SAFE,NEAR,NEXT_TO,DEATH,START,GOAL,COIN}
var level = 0
var level_name = "Level 0"
var new_text = "error"
var tile_text = ["You Hit a Wall","You are Safe","Danger is Close","You are Next to Danger","You Have Died","Next LEVEL","New Room Found","YOU WON \n THE GAME!"]
var set = 0
#location on map 
var map_x = 2
var map_y = 4 
var map_start_x = 2
var map_start_y = 4
var map_size_x = 6
var map_size_y = 5 #var event = "true"
#var last_direction = 1 # used to move out of wall is sticky walls
onready var level_list = [$Maps/Map1,$Maps/Map1,$Maps/Map2,$Maps/Map3,$Maps/Map4,$Maps/Map5]
onready var load_level = level_list[1]

var hold = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	map_size_x = len(load_level.row_1)-1
	print("Map X")
	print(map_size_x)
	map_size_y = len(load_level.map_2d)-1
	print("Map Y")
	print(map_size_y)
	
# key and button input 
func _process(event):
	if Input.is_action_just_pressed("ui_up") == true and hold == false:
		if map_y > 0: # set bount array 
			map_y -= 1
		var map_value = load_level.map_2d[map_y][map_x]
		print(map_value)
		new_text = tile_text[map_value]
		color_load = color_index[map_value] #set color
		blink()
		
	if Input.is_action_just_pressed("ui_down") == true and hold == false:
		if map_y < map_size_y: # set bount array
			map_y += 1
		var map_value = load_level.map_2d[map_y][map_x]
		print(map_value)
		color_load = color_index[map_value] #set color
		new_text = tile_text[map_value]
		blink()

	if Input.is_action_just_pressed("ui_right") == true and hold == false:
		if map_x < map_size_x: # set bount array
			map_x += 1
		var map_value = load_level.map_2d[map_y][map_x]
		print(map_value)
		color_load = color_index[map_value] #set color
		new_text = tile_text[map_value]
		blink()
		
	if Input.is_action_just_pressed("ui_left") == true and hold == false:
		if map_x > 0: # set bount array 
			map_x -= 1
		var map_value = load_level.map_2d[map_y][map_x]
		print(map_value)
		color_load = color_index[map_value] #set color
		new_text = tile_text[map_value]
		blink()

	if Input.is_action_just_pressed("reset"):
		death()
		#if Input.is_action_just_pressed("show_map") == true:
		#var format_string = "{map}"
		# Using the 'format' method, replace the 'str' placeholder
		#var actual_string = format_string.format({"map": $UI_Title.map_2d})
		#$UI_Title/VBoxContainer/Label2.update_text(actual_string)
		
func update_tile():
	$OmniLight.update_color(color_load)
	$LCD/Viewport/LCDscreen.update_text(new_text)
	$UI_Title/VBoxContainer/XandY.update_debug(map_x,map_y)
	var map_value = load_level.map_2d[map_y][map_x]
	if map_value == 4:
		death()
	if map_value == 6:
		level += 1
		new_level()
	hold = false		

func new_level(): 
	hold = true
	$OmniLight.update_color(Color(0,0,0,0))
	yield(get_tree().create_timer(0.4), "timeout")
	$OmniLight.update_color(color6)
	yield(get_tree().create_timer(0.4), "timeout")
	$OmniLight.update_color(Color(0,0,0,0))
	yield(get_tree().create_timer(0.4), "timeout")
	$OmniLight.update_color(color6)
	yield(get_tree().create_timer(0.4), "timeout")
	$OmniLight.update_color(Color(0,0,0,0))
	yield(get_tree().create_timer(0.4),"timeout")
	$OmniLight.update_color(color6)
	yield(get_tree().create_timer(0.4), "timeout")
	next_level()
	
func next_level():	
	load_level = level_list[level]# load new next map array  
	print(load_level)
	map_start_x = load_level.start_x
	map_start_y = load_level.start_y
	map_x = map_start_x
	map_y = map_start_y
	map_size_x = len(load_level.row_1)-1
	map_size_y = len(load_level.map_2d)-1
	var map_value = load_level.map_2d[map_start_y][map_start_x]
	print(map_value)
	color_load = color_index[map_value] #set color
	var format_string = "Level {x}"
	var actual_string = format_string.format({"x": level})
	tile_text[5] = actual_string
	new_text = tile_text[map_value]
	update_tile()
	
func death():
	print("you died")
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
	var map_value = load_level.map_2d[map_start_y][map_start_x]
	print(map_value)
	color_load = color_index[map_value] #set color
	new_text = tile_text[map_value]
	update_tile()
	#Restart Level
	
func blink(): 
	hold = true
	$OmniLight.update_color(Color(0,0,0,0))
	yield(get_tree().create_timer(0.5), "timeout")
	update_tile()	
# reset game 

func start():
	level = 1
	$OmniLight.update_color(Color(0,0,0,0))
	yield(get_tree().create_timer(0.4), "timeout")
	next_level()
	pass

func treasure():
	pass
