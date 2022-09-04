extends Control

# 0 = Brown Noise
# 1 = Filt. Brown Noise
# 2 = Filt. White Noise

var NoiseType # what noise has been set
onready var dropdown = $OptionButton # the dropdown menu

func _ready():
	NoiseType = 0

func _process(delta):
	if NoiseType == 0:
		$StaticBrown.play()
	if NoiseType == 1:
		$StaticBrownFilt.play()
	if NoiseType == 2:
		$StaticFilt.play()


func _on_OptionButton_item_selected(index):
	var selc = index
	
	if selc == 0:
		NoiseType = 0
	if selc == 1:
		NoiseType = 1
	if selc == 2:
		NoiseType = 2


func _on_Stop_button_up():
	$StaticBrown.stop()
	$StaticBrownFilt.stop()
	$StaticFilt.stop()
	
	


func _on_Play_button_up():
	pass # Replace with function body.
