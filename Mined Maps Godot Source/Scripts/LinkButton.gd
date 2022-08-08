extends LinkButton

func _pressed():
	print("Button Works")
	OS.shell_open("https://maxtaylermedia.itch.io")
