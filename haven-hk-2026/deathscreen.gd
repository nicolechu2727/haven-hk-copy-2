extends CanvasLayer
var pressed = false 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible=false
	pass # Replace with function body.
#func dead()->void:
	#visible=true
	#get_tree().paused=true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.death==true:
		#get_tree().change_scene_to_file("res://death.tscn")
		#print("hello")
		visible=true
	if pressed==true:
		print("lol")
		get_tree().change_scene_to_file("res://main.tscn")
		#get_tree().paused=true
	pass
	



func _on_button_pressed() -> void:
	print("asd")
	pressed = true
	print("pressed")
	get_tree().paused=false
	get_tree().change_scene_to_file("res://main.tscn")
	get_tree().reload_current_scene()
	pass # Replace with function body.
