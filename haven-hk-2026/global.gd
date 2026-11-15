extends Node
#@onready var score: Label=%score

@onready var currenthealth =100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(score)
	var currenthealth=100
	
	pass # Replace with function body.

var death=false
var scorenum=0
var text = "Score: "+str(scorenum)
#func scoreincrease()->void:
	#scorenum+=1
	#score.text=text
	
func _process(delta: float) -> void:
	if death==false:
		if currenthealth==0:
			get_tree().change_scene_to_file("res://death.tscn")
			print("changed")
			
			
			
			
			

			death=true
	
	
var timeincrement=1.5
func restorehealth()->void:
	if currenthealth<100:
		currenthealth=currenthealth+30
		timeincrement-=0.2
		#print(currenthealth)
		
