extends Control

var color0 = Color( 0.9, 0.7, 0.8, 1) # Wall Edge Edge of map 
var color1 = Color( 0, 0.7, 0.9, 1) # Safe Tile
var color2 = Color( 0.5, 0, 0.6, 1 ) # Near Danger
var color3 = Color( 0.80, 0.0, 0.80, 1 ) #Next to Danger.
var color4 = Color( 1, 0, 0, 1 ) # Death Tile Reset to start Tile
var color5 = Color( 0.0, 0.93, 0.2,1) # Start Tile 
var color6 = Color( 0.8,0.7,0, 1 ) # Next Level
var color7 = Color( 0.5,0.6,0, 1 ) # Points

var color_index = [color0,color1,color2,color3,color4,color5,color6,color7]
var color_load = Color(0,0,0,0)
#enum States {WALL,SAFE,NEAR,NEXT_TO,DEATH,START,GOAL,COIN}
var level = 0
var level_name = "Level 0"
var new_text = "error"
var tile_text = ["Robot Hit a Wall","Robot is Safe","Hazard is Near","Robot is Next \n to Hazard!!","Hazard Hit!!!","Next LEVEL","New Room Found","YOU WON \n THE GAME!"]
var set = 0

#location on map 
var map_x = 2
var map_y = 4 
var map_start_x = 2
var map_start_y = 4
var map_size_x = 6
var map_size_y = 5 #var event = "true"
#var last_direction = 1 # used to move out of wall is sticky walls
onready var level_list = [$Maps/Map0,$Maps/Map1,$Maps/Map2,$Maps/Map3,$Maps/Map4,$Maps/Map5]
onready var load_level = level_list[1]
onready var start_b = get_node("/root/Node2D/Control/StartButton") 
onready var start_l = get_node("/root/Node2D/Control/StartLabel") 
onready var buttons = get_node("/root/Node2D/Buttons") 
onready var tutorial = get_node("/root/Node2D/Tutorial/Sprite") 
var hold = true
var tutorial_on = false

func _ready():
	map_size_x = len(load_level.row_1)-1
	print("Map X")
	print(map_size_x)
	map_size_y = len(load_level.map_2d)-1
	print("Map Y")
	print(map_size_y)
	# update 
	#start()

#Keyboard Inputs
func _process(event):
	if Input.is_action_just_pressed("ui_up") == true:
		up_press()
		
	if Input.is_action_just_pressed("ui_down") == true:
		down_press()
		
	if Input.is_action_just_pressed("ui_right") == true:
		right_press()
		
	if Input.is_action_just_pressed("ui_left") == true:
		left_press()		
	if Input.is_action_just_pressed("reset_level") == true:
		reset()
	#if Input.is_action_just_pressed("signal_test") == true:
		#game_win()
#Signal From UI Buttons useable by Mouse
func _on_UpButton_pressed():
	up_press()
	
func _on_LeftButton_pressed():
	left_press()
	
func _on_DownButton_pressed():
	down_press()	
	
func _on_RightButton_pressed():
	right_press()
	
func _on_Start_pressed():
	start()
func _on_ResetButton_pressed():
	reset()
# test 
func up_press():
	if map_y > 0 or hold == false: # set bount array 
		map_y -= 1
		var map_value = load_level.map_2d[map_y][map_x]
		print(map_value)
		new_text = tile_text[map_value]
		color_load = color_index[map_value] #set color
		blink()
		
func down_press():			
		if map_y < map_size_y or hold == false: # set bount array
			map_y += 1
		var map_value = load_level.map_2d[map_y][map_x]
		print(map_value)
		color_load = color_index[map_value] #set color
		new_text = tile_text[map_value]
		blink()
		
func right_press():
	if map_x < map_size_x or hold == false: # set bount array
		map_x += 1
		var map_value = load_level.map_2d[map_y][map_x]
		print(map_value)
		color_load = color_index[map_value] #set color
		new_text = tile_text[map_value]
		blink()
		
func left_press():
	if map_x > 0 or hold == false: # set bount array 
		map_x -= 1
		var map_value = load_level.map_2d[map_y][map_x]
		print(map_value)
		color_load = color_index[map_value] #set color
		new_text = tile_text[map_value]
		blink()		
		
func blink(): 
	hold = true
	$OmniLight.update_color(Color(0,0,0,0))
	yield(get_tree().create_timer(0.5), "timeout")
	update_light()	

func update_light():
	$OmniLight.update_color(color_load)
	$LCDscreen.update_text(new_text)
	$XandY.update_debug(map_x,map_y)
	var map_value = load_level.map_2d[map_y][map_x]
	if map_value == 4:
		death()
	if map_value == 6:
		level += 1
		new_level()
	if map_value == 7:
		game_win()
	if tutorial_on == true:
		tutorial.update_loc()
	
	hold = false	#hold	
	

func death():
	$OmniLight.update_color(Color(0,0,0,0))
	yield(get_tree().create_timer(0.4), "timeout")
	$OmniLight.update_color(Color(1,0,0,1))
	yield(get_tree().create_timer(0.4), "timeout")
	$OmniLight.update_color(Color(0,0,0,0))
	yield(get_tree().create_timer(0.4), "timeout")
	$OmniLight.update_color(Color(1,0,0,1))
	yield(get_tree().create_timer(0.4), "timeout")
	reset()
	
func reset():	
	map_x = map_start_x
	map_y = map_start_y
	var map_value = load_level.map_2d[map_start_y][map_start_x]
	print(map_value)
	color_load = color_index[map_value] #set color
	new_text = tile_text[map_value]
	update_light()

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
	load_level = level_list[level]# load new from map array  
	print(load_level) #for debug 
	map_start_x = load_level.start_x # get and set map position 
	map_start_y = load_level.start_y
	map_x = map_start_x
	map_y = map_start_y
	map_size_x = len(load_level.row_1)-1 #Get Map X size Width
	map_size_y = len(load_level.map_2d)-1 #Get Map Y size Height
	var map_value = load_level.map_2d[map_start_y][map_start_x]
	print(map_value)
	color_load = color_index[map_value] #set color
	var format_string = "Level {x}" #Set up level Name for label 
	var actual_string = format_string.format({"x": level})
	tile_text[5] = actual_string
	new_text = tile_text[map_value]
	update_light()

func start():
	level = 1
	$OmniLight.visible = !$OmniLight.visible
	$OmniLight.update_color(Color(0,0,0,0))
	buttons.visible = true
	yield(get_tree().create_timer(0.4), "timeout")
	start_l.visible = !start_l.visible
	start_b.visible = !start_b.visible
	next_level()
	hold = false

func game_win():
	# turn game win on 
	print("Game Winner")
	var win  = $GameWin
	win.visible = true
	pass 
	

