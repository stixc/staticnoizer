extends Control

# 0 = Brown Noise
# 1 = Filt. Brown Noise
# 2 = Filt. White Noise
# 3 = Ocean
# 4 = River
# 5 = Heavy Rain

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
	elif NoiseType == 3:
		$Ocean.play()
	elif NoiseType == 4:
		$River.play()
	elif NoiseType == 5:
		$Rain.play()

func _on_OptionButton_item_selected(index):
	var selc = index
	
	if selc == 0:
		NoiseType = 0
		change_sound()
		$StaticBrownFilt.stop()
		$StaticFilt.stop()
		$Ocean.stop()
		$Rain.stop()
		$River.stop()
	elif selc == 1:
		NoiseType = 1
		change_sound()
		$StaticBrown.stop()
		$StaticFilt.stop()
		$Ocean.stop()
		$Rain.stop()
		$River.stop()
	elif selc == 2:
		NoiseType = 2
		change_sound()
		$StaticBrown.stop()
		$StaticBrownFilt.stop()
		$Ocean.stop()
		$Rain.stop()
		$River.stop()
	elif selc == 3:			# ocean
		NoiseType = 3
		change_sound()
		$StaticFilt.stop()
		$StaticBrown.stop()
		$StaticBrownFilt.stop()
		$Rain.stop()
		$River.stop()
	elif selc == 4:			# river
		NoiseType = 4
		change_sound()
		$StaticFilt.stop()
		$StaticBrown.stop()
		$StaticBrownFilt.stop()
		$Rain.stop()
		$Ocean.stop()
	elif selc == 5:			# rain
		NoiseType = 5
		change_sound()
		$StaticFilt.stop()
		$StaticBrown.stop()
		$StaticBrownFilt.stop()
		$Ocean.stop()
		$River.stop()


func _on_Stop_button_up():
	$StaticBrown.stop()
	$StaticBrownFilt.stop()
	$StaticFilt.stop()
	$Ocean.stop()
	$Rain.stop()
	$River.stop()
	
func _on_Play_button_up():
	change_sound()


func _on_AboutButton_pressed():
	$about_box.show()

func _on_CloseAboutButton_pressed():
	$about_box.hide()
