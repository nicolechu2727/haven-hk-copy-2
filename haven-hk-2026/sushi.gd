
extends Area2D
#signal restorehealth()
@export var value:int=1
#const MyAreaScene=preload("res://main.tscn")
#const SUSHI_SCENE = preload("res://sushi.tscn")
# Called when the node enters the scene tree for the first time.
var positions: Array=[
	[14,-324],
	[276,-306],
	[-43,-153],
	[45,-155],
	[153,-155],
	[240,-155],
	[-18,-4],
	[47,-12],
	[121,-17],
	[207,-32],
	[305,-44],
	[365,-48],
	[359,133],
	[246,135],
	[158,133],
	[69,128],
	[-21,128],
	[-115,124],
	[-288,35],
	[-415,40],
	[-632,187],
	[-517,187],
	[-376,187],
	[-248,187],
	[-620,-108],
	[-527,-115],
	[-427,-112],
	[-575,-321],
	[-484,-390]

]
@onready var sushi: Area2D=self
#var costumes:Array=[
	#
#]


var currentclone: Area2D

func spawn_random_clone():
	#var SUSHI_SCENE = load("res://sushi.tscn")
	##var currentclone=sushi.duplicate()
	##print(currentclone)
	#var newsushi=SUSHI_SCENE.instantiate()
	
	var positionlis=positions.pick_random()
	print(positionlis[0],positionlis[1])
	sushi.position=Vector2(positionlis[0],positionlis[1])
	
	#get_parent().add_child.call_deferred(newsushi)
func _ready() -> void:
	print(sushi)
	score= get_tree().current_scene.get_node_or_null("%score")
	#if not body_entered.is_connected(_on_body_entered):
		#body_entered.connect(_on_body_entered)
	
	sushi.visible=true
	#spawn_random_clone() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@onready var score: Label = $"CanvasLayer/Control/score"



func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		#Global.scoreincrease()
		Global.scorenum+=1
		score.text="Score: "+str(Global.scorenum)

		
		spawn_random_clone()
		Global.restorehealth()
		#restorehealth.emit()
		
		#queue_free()
	
