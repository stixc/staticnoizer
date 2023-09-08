extends Control

const NOISE_BROWN = 0
const NOISE_FILTERED_BROWN = 1
const NOISE_FILTERED_WHITE = 2
const NOISE_OCEAN = 3
const NOISE_RIVER = 4
const NOISE_HEAVY_RAIN = 5
const NOISE_AIR_CONDITIONER = 6
const NOISE_BOX_FAN = 7
const NOISE_DIGISPACE = 8 

var selected_noise = NOISE_BROWN
onready var dropdown: OptionButton = $OptionButton
var audio_nodes: Array = []

func _ready() -> void:
	for i in range(get_child_count()):
		var child = get_child(i)
		if child is AudioStreamPlayer:
			audio_nodes.append(child)

	change_sound()

func _on_OptionButton_item_selected(index: int) -> void:
	selected_noise = index
	change_sound()

func change_sound() -> void:
	stop_all_sounds()

	if selected_noise < audio_nodes.size():
		audio_nodes[selected_noise].play()

func stop_all_sounds() -> void:
	for node in audio_nodes:
		node.stop()

func _on_Stop_button_up() -> void:
	stop_all_sounds()

func _on_Play_button_up() -> void:
	change_sound()

func _on_AboutButton_pressed() -> void:
	$about_box.show()

func _on_CloseAboutButton_pressed() -> void:
	$about_box.hide()
