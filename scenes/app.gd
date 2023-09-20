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
onready var celebrate_area = $about_box/celebrate
onready var datetext = $about_box/celebrate/datetext
onready var stixc_figure = $about_box/celebrate/stixcparty
var audio_nodes: Array = []
var current_date = OS.get_datetime()
var is_celebrating = false

func _ready() -> void:
	for i in range(get_child_count()):
		var child = get_child(i)
		if child is AudioStreamPlayer:
			audio_nodes.append(child)

	if is_celebrating == true:
		$about_box/AppDesc.hide()
	elif is_celebrating == false:
		$about_box/AppDesc.show()

	date_check()
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

func date_check() -> void:
	# Checks date so that the app does funny stuff on specific dates, specifically holidays

	# StaticNoizer's birthday
	if current_date.month == 9 && current_date.day == 4:
		celebrate_area.show()
		stixc_figure.show()
		var app_release_date = 2022
		var current_year = current_date.year
		var app_age = current_year - app_release_date
		is_celebrating = true

		datetext.set_text("Happy Birthday StaticNoizer!\nThe first commit was " + str(app_age) + " year(s) ago!")
	# stixc's birthday
	elif current_date.month == 10 && current_date.day == 23:
		celebrate_area.show()
		stixc_figure.show()
		var stixc_birth_year = 2001
		var current_year = current_date.year
		var stixc_age = current_year - stixc_birth_year
		is_celebrating = true

		datetext.set_text("Happy Birthday stixc!\nstixc is now " + str(stixc_age) + " years old!")
	# Halloween
	elif current_date.month == 10 && current_date.day == 31:
		celebrate_area.show()
		stixc_figure.hide()
		datetext.set_text("Happy Halloween!\nThis app is NOT haunted. No worries.")
		is_celebrating = true
	# Christmas
	elif (current_date.month == 12 && current_date.day == 24) or (current_date.month == 12 && current_date.day == 25):
		celebrate_area.show()
		stixc_figure.hide()
		datetext.set_text("Merry Christmas!")
		is_celebrating = true
	# New Years
	elif current_date.month == 1 && current_date.day == 1:
		celebrate_area.show()
		stixc_figure.show()
		var current_year = current_date.year
		is_celebrating = true

		datetext.set_text("Happy New Year!\nIt is now " + str(current_year) + "!")
	# Valentine's Day
	elif current_date.month == 2 && current_date.day == 14:
		celebrate_area.show()
		stixc_figure.hide()
		datetext.set_text("Happy Valentine's Day!")
		is_celebrating = true
	# Pride Month
	elif current_date.month == 6:
		celebrate_area.show()
		datetext.set_text("Happy Pride Month!\nYou are loved and amazing!")
		is_celebrating = true
	else:
		celebrate_area.hide()
		stixc_figure.hide()
		is_celebrating = false

func _on_Stop_button_up() -> void:
	stop_all_sounds()

func _on_Play_button_up() -> void:
	change_sound()

func _on_AboutButton_pressed() -> void:
	$about_box.show()

func _on_CloseAboutButton_pressed() -> void:
	$about_box.hide()
