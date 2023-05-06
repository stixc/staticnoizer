extends Control

# 0 = Brown Noise
# 1 = Filt. Brown Noise
# 2 = Filt. White Noise

var NoiseType # what noise has been set
onready var dropdown = $OptionButton # the dropdown menu

func _ready() -> void:
	NoiseType = 0
	change_sound()

func _process(delta):
	pass

func change_sound():
	if NoiseType == 0:
		$StaticBrown.play()
	elif NoiseType == 1:
		$StaticBrownFilt.play()
	elif NoiseType == 2:
		$StaticFilt.play()

func _on_OptionButton_item_selected(index):
	var selc = index
	
	if selc == 0:
		NoiseType = 0
		change_sound()
		$StaticBrownFilt.stop()
		$StaticFilt.stop()
	elif selc == 1:
		NoiseType = 1
		change_sound()
		$StaticBrown.stop()
		$StaticFilt.stop()
	elif selc == 2:
		NoiseType = 2
		change_sound()
		$StaticBrown.stop()
		$StaticBrownFilt.stop()


func _on_Stop_button_up():
	$StaticBrown.stop()
	$StaticBrownFilt.stop()
	$StaticFilt.stop()
	
func _on_Play_button_up():
	change_sound()
