extends Label


func update_debug(x,y):
	var format_string = "X:{x} Y:{y}"

# Using the 'format' method, replace the 'str' placeholder
	var actual_string = format_string.format({"x": x,"y":y})
	#print(actual_string)
	self.text = actual_string

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
