extends Control
var open = false
var shown = false

var level2_1 = false
export var level2_1_slot = 'niks'

var level2_2 = false
export var level2_2_slot = 'niks'

var level2_3 = false
export var level2_3_slot = 'niks'
export var debug = true
# Called when the node enters the scene tree for the first time.
func _ready():
	if debug:
		$AnimationPlayer.play("show")

func clarify():
	yield(get_tree().create_timer(0.5),"timeout")	
	_on_Button_pressed()
	yield(get_tree().create_timer(0.5),"timeout")
	_on_Button_pressed()
	yield(get_tree().create_timer(0.5),"timeout")
	_on_Button_pressed()

func show_note(note_number):
	match note_number:
		1:
			$CanvasLayer/Level1/Note.show_1()
		2:
			$CanvasLayer/Level1/Note.show_2()
		3:
			$CanvasLayer/Level1/Note.show_3()
		4:
			$CanvasLayer/Level1/Note.show_4()
		5:
			hide_all()
			match level2_1_slot:
				'ouders':
					$CanvasLayer/Level2/ouders.show()
				'crazy_guy':
					$CanvasLayer/Level2/crazy_guy.show()
				'lil_girl':
					$CanvasLayer/Level2/lil_girl.show()
			$CanvasLayer/Level2.show()
			$CanvasLayer/Level3/AnimationPlayer2.play_backwards("show_3")
			$CanvasLayer/Level2/AnimationPlayer.play("show_all")
		6:
			hide_all()
			match level2_2_slot:
				'ouders':
					$CanvasLayer/Level2/ouders.show()
				'crazy_guy':
					$CanvasLayer/Level2/crazy_guy.show()
				'lil_girl':
					$CanvasLayer/Level2/lil_girl.show()
			$CanvasLayer/Level2.show()
			$CanvasLayer/Level3/AnimationPlayer2.play_backwards("show_3")
			$CanvasLayer/Level2/AnimationPlayer.play("show_all")
			
		7:
			hide_all()
			match level2_3_slot:
				'ouders':
					$CanvasLayer/Level2/crazy_guy.hide()
					$CanvasLayer/Level2/lil_girl.hide()
					$CanvasLayer/Level2/ouders.show()
				'crazy_guy':
					$CanvasLayer/Level2/crazy_guy.show()
					$CanvasLayer/Level2/lil_girl.hide()
					$CanvasLayer/Level2/ouders.hide()
				'lil_girl':
					$CanvasLayer/Level2/crazy_guy.hide()
					$CanvasLayer/Level2/lil_girl.show()
					$CanvasLayer/Level2/ouders.hide()
			$CanvasLayer/Level2.show()
			$CanvasLayer/Level3/AnimationPlayer2.play_backwards("show_3")
			$CanvasLayer/Level2/AnimationPlayer.play("show_all")
		8:
			hide_all()
			$CanvasLayer/Level3.show()
			$CanvasLayer/Level3/note1.show()
			$CanvasLayer/Level3/AnimationPlayer2.play("show_3")
			$CanvasLayer/Level2/AnimationPlayer.play_backwards("show_all")

			
		9:
			hide_all()
			$CanvasLayer/Level3.show()
			$CanvasLayer/Level3/note2.show()
			$CanvasLayer/Level3/AnimationPlayer2.play("show_3")
			$CanvasLayer/Level2/AnimationPlayer.play_backwards("show_all")

		10:
			hide_all()
			$CanvasLayer/Level3.show()
			$CanvasLayer/Level3/note3.show()
			$CanvasLayer/Level3/AnimationPlayer2.play("show_3")
			$CanvasLayer/Level2/AnimationPlayer.play_backwards("show_all")

func update_stuff(): 
	match GlobalVariables.total_notes:
		1:
			$CanvasLayer/Node2D/Notes/note.show()
		2:
			$CanvasLayer/Node2D/Notes/note2.show()
		3:
			$CanvasLayer/Node2D/Notes/note3.show()
		4:
			$CanvasLayer/Node2D/Notes/note4.show()
		5:
			$CanvasLayer/Node2D/Notes/note5.show()
		6:
			$CanvasLayer/Node2D/Notes/note6.show()
		7:
			$CanvasLayer/Node2D/Notes/note7.show()	
		8:
			$CanvasLayer/Node2D/Notes/note8.show()
		9:
			$CanvasLayer/Node2D/Notes/note9.show()
		10:
			$CanvasLayer/Node2D/Notes/note10.show()

func hide_all():
	$CanvasLayer/Level1/Note.hide_all()
	$CanvasLayer/Level3/note3.hide()
	$CanvasLayer/Level3/note1.hide()
	$CanvasLayer/Level3/note2.hide()
	$CanvasLayer/Level2/crazy_guy.hide()
	$CanvasLayer/Level2/lil_girl.hide()
	$CanvasLayer/Level2/ouders.hide()

func show_handler():
	if !shown:
		shown = true
		$CanvasLayer/Node2D.show()
		$AnimationPlayer.play("show")

func hide_handler():
	if shown:
		shown = false
		$AnimationPlayer.play_backwards("show")
		yield(get_tree().create_timer(1),"timeout")
		$CanvasLayer/Node2D.hide()

func _on_Button_mouse_entered():
	if open == false:
		$CanvasLayer/Node2D/Notepad/Hover.play("show_note")


func _on_Button_mouse_exited():
	if open == false:
		$CanvasLayer/Node2D/Notepad/Hover.play_backwards("show_note")


func _on_Button_pressed():
	if open == false:
		$CanvasLayer/Node2D/Notes/Popout.play("popout")
		$CanvasLayer/Node2D/Notepad/Hover.play("show_note")
		open = true
		match GlobalVariables.total_notes:
			1:
				$CanvasLayer/Node2D/Notes/note.show()
			2:
				$CanvasLayer/Node2D/Notes/note2.show()
			3:
				$CanvasLayer/Node2D/Notes/note3.show()
			4:
				$CanvasLayer/Node2D/Notes/note4.show()
			5:
				$CanvasLayer/Node2D/Notes/note5.show()
			6:
				$CanvasLayer/Node2D/Notes/note6.show()
			7:
				$CanvasLayer/Node2D/Notes/note7.show()
			8:
				$CanvasLayer/Node2D/Notes/note8.show()
			9:
				$CanvasLayer/Node2D/Notes/note9.show()
			10:
				$CanvasLayer/Node2D/Notes/note10.show()

	else:
		$CanvasLayer/Node2D/Notes/Popout.play_backwards("popout")
		$CanvasLayer/Node2D/Notepad/Hover.play_backwards("show_note")
		open = false


func _on_Hider_pressed():
	$CanvasLayer/Level2/AnimationPlayer.play_backwards("show_all")
	yield(get_tree().create_timer(0.5),"timeout")
	$CanvasLayer/Level2.hide()
	print("hid stuff 1")
	


func _on_Level3Hider_pressed():
	$CanvasLayer/Level3/AnimationPlayer2.play_backwards("show_3")
	yield(get_tree().create_timer(0.5),"timeout")
	$CanvasLayer/Level3.hide()
	print("hid stuff 2")
