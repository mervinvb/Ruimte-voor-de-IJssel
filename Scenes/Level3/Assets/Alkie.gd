extends Sprite

var in_body
onready var dialoguePopup = get_tree().root.get_node("World/CanvasLayer/DialoguePopup")
var state = 1 
var waiting = true
var time_left = 60
var started_counting = false
var state_2
export var debug = false

func _ready():
	NoteHandler.show_handler()

func _input(event):
	if Input.is_action_just_pressed("interact") and in_body == true:
		print("going to talk")
		talk()

func talk(answer = ""):
	if GlobalVariables.total_notes == 10 or debug == true:
		match state:
			1:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Jij"
				dialoguePopup.dialogue = "Hoi mevrouw Alkemade!"
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state += 1
			2:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mevr. Alkemade"
				dialoguePopup.dialogue = "Oh, daar ben je! Ik begon me al zorgen te maken! "
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state += 1
			3:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Jij"
				dialoguePopup.dialogue = "Ik moest nog mijn telefoon zoeken in de bus. "
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state += 1
			4:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mevr. Alkemade"
				dialoguePopup.dialogue = "Zeg, die telefoon heb je toch helemaal niet nodig op een school excursie?"
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state += 1
			5:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mevr. Alkemade"
				dialoguePopup.dialogue = "Ik heb altijd notities bij me, dan hoef ik nooit wat op te zoeken..."
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state += 1
			6:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mevr. Alkemade"
				dialoguePopup.dialogue = "Jammergenoeg ben ik mijn notities kwijt geraakt aan het begin van de reis."
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state += 1
			7:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Jij"
				dialoguePopup.dialogue = "Dat weet ik, daarom heb ik ze samen met mr. van Voorden gezocht!"
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state += 1
			8:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Jij"
				dialoguePopup.dialogue = "We hebben ze allemaal gevonden!"
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state += 1
			9:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mevr. Alkemade"
				dialoguePopup.dialogue = "Wat geweldig! Heel erg bedankt!"
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state += 1
			10:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Jij"
				dialoguePopup.dialogue = "Geen probleem, het was best leerzaam om ze te zoeken!"
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state += 1
			11:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mevr. Alkemade"
				dialoguePopup.dialogue = "Oh ja? Dan vind je het vast niet erg als ik je even overhoor?"
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state += 1
			12:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Jij"
				dialoguePopup.dialogue = "Uuuhm........."
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state += 1
			13:
				if !started_counting:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Mevr. Alkemade"
					dialoguePopup.dialogue = "Ik geef je 1 minuut om je notities door te lezen, daarna begint de overhoring!"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					state += 1
				else:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Mevr. Alkemade"
					dialoguePopup.dialogue = "Als ik jou was zou ik jouw notities doornemen!"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					state += 1
			14:
				if !started_counting:
					MusicPlayer.bossfight()
					if debug:
						time_left = 1
					minuut()
					dialoguePopup.close()
					NoteHandler.clarify()
					state -= 1
				else:
					dialoguePopup.close()
					state -= 1
			15:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mevr. Alkemade"
				dialoguePopup.dialogue = "We gaan beginnen!!!"
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				NoteHandler.queue_free()
				state += 1
			16:
				dialoguePopup.close()
				SceneChanger.changescene("res://Scenes/Bossfight/Bossfight.tscn")
				state += 1
	else:
		pass

func note_made():
	pass
	
func minuut():
	if !started_counting:
		$CanvasLayer/Label.text = str(time_left)
		$CanvasLayer/Label.show()
		$Timer.start()
		started_counting = true
	
func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		$AnimationPlayer2.play("show_text")
		in_body = true


func _on_Area2D_body_exited(body):
	if body.name == 'Player':
		$AnimationPlayer2.play_backwards("show_text")
		in_body = false


func _on_Timer_timeout():
	time_left -= 1
	$CanvasLayer/Label.text = str(time_left)
	$CanvasLayer/AnimationPlayer.play("show_timer")
	if time_left == 0:
		state = 15
		talk()
