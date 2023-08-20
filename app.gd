extends Control

# 0 = Brown Noise
# 1 = Filt. Brown Noise
# 2 = Filt. White Noise
# 3 = Ocean
# 4 = River
# 5 = Heavy Rain
# 6 = Air Conditioner
# 7 = Box Fan

var NoiseType # what noise has been set
onready var dropdown = $OptionButton # the dropdown menu

func _ready() -> void:
	NoiseType = 0
	change_sound()

func _process(delta):
	pass

# TODO: HOLY THIS CODE SUCKS - EFFICIENCY NOW
# I need to figure out how to make it so that it's a set variable
# or something along the lines of that instead of just YandreDev-ing it
# and just having long stupid lines like what you are about to witness:

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
	elif NoiseType == 6:
		$AirCon.play()
	elif NoiseType == 7:
		$BoxFan.play()

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
		$AirCon.stop()
		$BoxFan.stop()
	elif selc == 1:
		NoiseType = 1
		change_sound()
		$StaticBrown.stop()
		$StaticFilt.stop()
		$Ocean.stop()
		$Rain.stop()
		$River.stop()
		$AirCon.stop()
		$BoxFan.stop()
	elif selc == 2:
		NoiseType = 2
		change_sound()
		$StaticBrown.stop()
		$StaticBrownFilt.stop()
		$Ocean.stop()
		$Rain.stop()
		$River.stop()
		$AirCon.stop()
		$BoxFan.stop()
	elif selc == 3:			# ocean
		NoiseType = 3
		change_sound()
		$StaticFilt.stop()
		$StaticBrown.stop()
		$StaticBrownFilt.stop()
		$Rain.stop()
		$River.stop()
		$AirCon.stop()
		$BoxFan.stop()
	elif selc == 4:			# river
		NoiseType = 4
		change_sound()
		$StaticFilt.stop()
		$StaticBrown.stop()
		$StaticBrownFilt.stop()
		$Rain.stop()
		$Ocean.stop()
		$AirCon.stop()
		$BoxFan.stop()
	elif selc == 5:			# rain
		NoiseType = 5
		change_sound()
		$StaticFilt.stop()
		$StaticBrown.stop()
		$StaticBrownFilt.stop()
		$Ocean.stop()
		$River.stop()
		$AirCon.stop()
		$BoxFan.stop()
	elif selc == 6:
		NoiseType = 6
		change_sound()
		$StaticFilt.stop()
		$StaticBrown.stop()
		$StaticBrownFilt.stop()
		$Ocean.stop()
		$River.stop()
		$Rain.stop()
		$BoxFan.stop()
	elif selc == 7:
		NoiseType = 7
		change_sound()
		$StaticFilt.stop()
		$StaticBrown.stop()
		$StaticBrownFilt.stop()
		$Ocean.stop()
		$River.stop()
		$Rain.stop()
		$AirCon.stop()


func _on_Stop_button_up():
	$StaticBrown.stop()
	$StaticBrownFilt.stop()
	$StaticFilt.stop()
	$Ocean.stop()
	$Rain.stop()
	$River.stop()
	$AirCon.stop()
	$BoxFan.stop()
	
func _on_Play_button_up():
	change_sound()


func _on_AboutButton_pressed():
	$about_box.show()

func _on_CloseAboutButton_pressed():
	$about_box.hide()
