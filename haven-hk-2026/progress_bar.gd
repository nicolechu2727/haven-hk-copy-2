extends ProgressBar

@export var character: Dough
# Called when the node enters the scene tree for the first time.
@export var maxhealth: float = 100.0
@onready var health_bar: ProgressBar = $"."
#@onready var healthbar: ProgressBar=$HealthBar
#var currenthealth=maxhealth
var fill_style: StyleBoxFlat
#func updatecolor():
	#var style_box = health_bar.get_theme_stylebox("fill") as StyleBoxFlat
	#var ratio=health_bar.value/health_bar.max_value
	#fill_style.bg_color=Color.RED.lerp(Color.GREEN,ratio)
func _ready() -> void:
	health_bar.max_value=maxhealth
	fill_style =  StyleBoxFlat.new()
	add_theme_stylebox_override("fill",fill_style)
	fill_style.bg_color = Color.GREEN
	Global.currenthealth=100
	Global.timeincrement=1.5
	


	
	



# Called every frame. 'delta' is the elapsed time 
var savetime=0.0

func _process(delta: float) -> void:
	health_bar.value=Global.currenthealth
	if int(Global.currenthealth)%10!=0:
		print(Global.currenthealth)
	var ratio=health_bar.value/health_bar.max_value
	fill_style.bg_color=Color.RED.lerp(Color.GREEN,ratio)
	savetime+=delta
	if savetime>=Global.timeincrement:
		print(savetime,"inc",Global.timeincrement)
		
		Global.currenthealth = Global.currenthealth-10
		savetime=delta
		health_bar.value=Global.currenthealth
		#timeincrement = timeincrement-0.01
		savetime=0
		
