extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game

func _ready():
	$MainMenu/Buttons/Start.grab_focus()

class Colors:
	const RED = "f76a4f"
	const RED_DARK = "3a0903"
	
func change_text_color(color, dark_color):
	$Message.add_theme_color_override("font_color", Color(color))
	$Message.add_theme_color_override("font_outline_color", Color(dark_color))
	$Message.add_theme_color_override("font_shadow_color", Color(dark_color))

func show_message(text, color, dark_color):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	change_text_color(color, dark_color)
	
func show_game_over():
	show_message("Game Over", Colors.RED, Colors.RED_DARK)
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	$Message.hide()
	$MainMenu.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1).timeout
	$MainMenu/Buttons.show()	
	$MainMenu/Buttons/Start.grab_focus()
	
func update_score(score):
	$ScoreLabel.text = str(score)

func _on_message_timer_timeout():	
	$Message.hide()

func _on_start_pressed():
	$MainMenu.hide()
	$MainMenu/Buttons.hide()
	start_game.emit()

func _on_options_pressed():
	$MainMenu.hide()
	#$Options.show()
	$Options.set_position(Vector2(0, 0))

func _on_back_to_menu_pressed():
	$Options.set_position(Vector2(600, 0))
	$MainMenu.show()
	
func _on_exit_pressed():
	get_tree().quit()

